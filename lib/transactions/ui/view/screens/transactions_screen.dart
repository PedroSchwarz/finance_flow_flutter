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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (_, __) {
            return [
              SliverAppBar.medium(
                title: const Text('Transactions'),
                bottom: PreferredSize(
                  preferredSize: const Size(0, AppSpacing.s),
                  child: BlocSelector<TransactionsCubit, TransactionsState, bool>(
                    bloc: bloc,
                    selector: (state) => state.isLoading || state.isRefreshing,
                    builder: (context, isLoading) => isLoading ? const LinearProgressIndicator() : const SizedBox.shrink(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.s),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocSelector<TransactionsCubit, TransactionsState, TransactionsListType>(
                        bloc: bloc,
                        selector: (state) => state.listType,
                        builder: (context, listType) {
                          return DropdownButton<TransactionsListType>(
                            value: listType,
                            icon: const Padding(padding: EdgeInsets.only(left: AppSpacing.s), child: Icon(Icons.list, color: Colors.orange)),
                            items:
                                TransactionsListType.values.map((type) {
                                  return DropdownMenuItem(
                                    value: type,
                                    child: Text(switch (type) {
                                      TransactionsListType.list => 'List',
                                      TransactionsListType.calendar => 'Calendar',
                                    }),
                                  );
                                }).toList(),
                            onChanged: (value) => bloc.updateListType(value!),
                          );
                        },
                      ),
                      BlocSelector<TransactionsCubit, TransactionsState, TransactionsTypeFilter>(
                        bloc: bloc,
                        selector: (state) => state.typeFilter,
                        builder: (context, typeFilter) {
                          return DropdownButton<TransactionsTypeFilter>(
                            value: typeFilter,
                            icon: const Padding(padding: EdgeInsets.only(left: AppSpacing.s), child: Icon(Icons.repeat, color: Colors.green)),
                            items:
                                TransactionsTypeFilter.values.map((filter) {
                                  return DropdownMenuItem(
                                    value: filter,
                                    child: Text(switch (filter) {
                                      TransactionsTypeFilter.all => 'All',
                                      TransactionsTypeFilter.incomes => 'Incomes',
                                      TransactionsTypeFilter.expenses => 'Expenses',
                                    }),
                                  );
                                }).toList(),
                            onChanged: (value) => bloc.updateTransactionsTypeFilter(value!),
                          );
                        },
                      ),
                      BlocSelector<TransactionsCubit, TransactionsState, TransactionsDateSort>(
                        bloc: bloc,
                        selector: (state) => state.dateSort,
                        builder: (context, dateSort) {
                          return DropdownButton<TransactionsDateSort>(
                            value: dateSort,
                            icon: const Padding(padding: EdgeInsets.only(left: AppSpacing.s), child: Icon(Icons.sort, color: Colors.blue)),
                            items:
                                TransactionsDateSort.values.map((sort) {
                                  return DropdownMenuItem(
                                    value: sort,
                                    child: Text(switch (sort) {
                                      TransactionsDateSort.newest => 'Newest',
                                      TransactionsDateSort.oldest => 'Oldest',
                                    }),
                                  );
                                }).toList(),
                            onChanged: (value) => bloc.updateDateSort(value!),
                          );
                        },
                      ),
                    ],
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
                          background: theme.scaffoldBackgroundColor,
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
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
