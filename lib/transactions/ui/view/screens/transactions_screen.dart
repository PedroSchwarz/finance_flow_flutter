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
                title: const Text('Transaction'),
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
                child: SizedBox(
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
