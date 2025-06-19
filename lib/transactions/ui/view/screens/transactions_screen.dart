import 'package:calendar_pager/calendar_pager.dart';
import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  static const String routeName = 'transactions';

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final bloc = getIt<TransactionsCubit>();

  @override
  void initState() {
    super.initState();
    bloc.load();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<TransactionsCubit, TransactionsState>(
      bloc: bloc,
      listenWhen: (previous, current) => previous.transactionToBeDeleted != current.transactionToBeDeleted,
      listener: _listenTransactionToBeDeleted,
      child: Scaffold(
        body: Stack(
          children: [
            const AnimatedBackground(),
            NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (_, __) {
                return [
                  BlocSelector<TransactionsCubit, TransactionsState, bool>(
                    bloc: bloc,
                    selector: (state) => state.isLoading || state.isRefreshing,
                    builder: (context, isLoading) {
                      return AppSliverAppBar(title: 'Transactions', isLoading: isLoading);
                    },
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(AppSpacing.s, AppSpacing.s, AppSpacing.s, AppSpacing.xm),
                        child: Row(
                          spacing: AppSpacing.s,
                          children: [
                            BlocSelector<TransactionsCubit, TransactionsState, TransactionsListType>(
                              bloc: bloc,
                              selector: (state) => state.listType,
                              builder: (context, listType) {
                                return LiquidGlassCard(
                                  padding: const EdgeInsets.all(AppSpacing.s),
                                  borderRadius: BorderRadius.circular(AppSpacing.xs),
                                  isTransparent: true,
                                  child: DropdownButton<TransactionsListType>(
                                    value: listType,
                                    isDense: true,
                                    icon: const Padding(padding: EdgeInsets.only(left: AppSpacing.s), child: Icon(Icons.list)),
                                    items:
                                        TransactionsListType.values.map((type) {
                                          return DropdownMenuItem(
                                            value: type,
                                            child: Text(switch (type) {
                                              TransactionsListType.list => 'List',
                                              TransactionsListType.calendar => 'Calendar',
                                            }, style: const TextStyle().copyWith(color: type == listType ? theme.colorScheme.primary : null)),
                                          );
                                        }).toList(),
                                    onChanged: (value) => bloc.updateListType(value!),
                                    borderRadius: BorderRadius.circular(AppSpacing.s),
                                    dropdownColor: theme.colorScheme.surfaceContainer,
                                    underline: const SizedBox.shrink(),
                                  ),
                                );
                              },
                            ),
                            BlocSelector<TransactionsCubit, TransactionsState, TransactionsTypeFilter>(
                              bloc: bloc,
                              selector: (state) => state.typeFilter,
                              builder: (context, typeFilter) {
                                return LiquidGlassCard(
                                  padding: const EdgeInsets.all(AppSpacing.s),
                                  borderRadius: BorderRadius.circular(AppSpacing.xs),
                                  isTransparent: true,
                                  child: DropdownButton<TransactionsTypeFilter>(
                                    value: typeFilter,
                                    isDense: true,
                                    icon: const Padding(padding: EdgeInsets.only(left: AppSpacing.s), child: Icon(Icons.repeat)),
                                    items:
                                        TransactionsTypeFilter.values.map((filter) {
                                          return DropdownMenuItem(
                                            value: filter,
                                            child: Text(switch (filter) {
                                              TransactionsTypeFilter.all => 'All',
                                              TransactionsTypeFilter.incomes => 'Incomes',
                                              TransactionsTypeFilter.expenses => 'Expenses',
                                            }, style: const TextStyle().copyWith(color: filter == typeFilter ? theme.colorScheme.primary : null)),
                                          );
                                        }).toList(),
                                    onChanged: (value) => bloc.updateTransactionsTypeFilter(value!),
                                    borderRadius: BorderRadius.circular(AppSpacing.s),
                                    dropdownColor: theme.colorScheme.surfaceContainer,
                                    underline: const SizedBox.shrink(),
                                  ),
                                );
                              },
                            ),
                            BlocSelector<TransactionsCubit, TransactionsState, TransactionsDateSort>(
                              bloc: bloc,
                              selector: (state) => state.dateSort,
                              builder: (context, dateSort) {
                                return LiquidGlassCard(
                                  padding: const EdgeInsets.all(AppSpacing.s),
                                  borderRadius: BorderRadius.circular(AppSpacing.xs),
                                  isTransparent: true,
                                  child: DropdownButton<TransactionsDateSort>(
                                    value: dateSort,
                                    isDense: true,
                                    icon: const Padding(padding: EdgeInsets.only(left: AppSpacing.s), child: Icon(Icons.sort)),
                                    items:
                                        TransactionsDateSort.values.map((sort) {
                                          return DropdownMenuItem(
                                            value: sort,
                                            child: Text(switch (sort) {
                                              TransactionsDateSort.newest => 'Newest',
                                              TransactionsDateSort.oldest => 'Oldest',
                                            }, style: const TextStyle().copyWith(color: sort == dateSort ? theme.colorScheme.primary : null)),
                                          );
                                        }).toList(),
                                    onChanged: (value) => bloc.updateDateSort(value!),
                                    borderRadius: BorderRadius.circular(AppSpacing.s),
                                    dropdownColor: theme.colorScheme.surfaceContainer,
                                    underline: const SizedBox.shrink(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlocSelector<TransactionsCubit, TransactionsState, TransactionsListType>(
                      bloc: bloc,
                      selector: (state) => state.listType,
                      builder: (context, listType) {
                        if (listType == TransactionsListType.list) {
                          return const SizedBox.shrink();
                        }

                        return SizedBox(
                          height: CalendarPagerViewConstants.collapsedHeight,
                          child: CalendarPagerView(
                            theme: CalendarPagerTheme.from(
                              background: Colors.transparent,
                              accent: theme.colorScheme.primary,
                              headerTitle: theme.textTheme.headlineLarge!,
                              itemBorder: theme.colorScheme.primary,
                              onAccent: theme.colorScheme.onPrimary,
                              hasShadow: false,
                            ),
                            hasHeader: false,
                            onDateSelected: bloc.updateSelectedDate,
                          ),
                        );
                      },
                    ),
                  ),
                ];
              },
              body: BlocBuilder<TransactionsCubit, TransactionsState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingTransactionsList();
                  }

                  final transactions = state.filteredTransactions;

                  if (transactions.isEmpty) {
                    return const Center(child: Text('No transactions found'));
                  }

                  return TransactionsList(
                    onRefresh: bloc.refresh,
                    transactions: transactions,
                    onDelete: (transaction) async {
                      bloc.selectTransactionToDelete(transaction);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: LiquidGlassCard(
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () async {
              if (context.mounted) {
                final result = await context.pushNamed<bool>(CreateTransactionScreen.routeName);

                if (result ?? false) {
                  await bloc.refresh();
                }
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  void _listenTransactionToBeDeleted(BuildContext context, TransactionsState state) {
    final transaction = state.transactionToBeDeleted;

    if (transaction != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete ${transaction.title}?'),
            content: const Text('This action cannot be undone.'),
            actions: [
              TextButton(onPressed: () => bloc.selectTransactionToDelete(null), child: const Text('Cancel')),
              TextButton(onPressed: bloc.deleteTransaction, child: const Text('Delete')),
            ],
          );
        },
      );
    } else {
      context.pop();
    }
  }
}
