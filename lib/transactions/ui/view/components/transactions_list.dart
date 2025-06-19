import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({required this.onRefresh, required this.transactions, required this.onDelete, super.key});

  final Future<void> Function() onRefresh;
  final List<TransactionResponse> transactions;
  final Future<void> Function(TransactionResponse transaction) onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppSpacing.s, left: AppSpacing.s, right: AppSpacing.s),
          child: Text('Movements', style: theme.textTheme.titleLarge),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.separated(
              padding: const EdgeInsets.only(top: AppSpacing.s, bottom: AppSpacing.max),
              itemCount: transactions.length,
              itemBuilder: (context, position) {
                final transaction = transactions[position];

                return TransactionItem(
                  transaction: transaction,
                  onDelete: () async {
                    await onDelete(transaction);
                  },
                );
              },
              separatorBuilder: (context, index) => const Gap(AppSpacing.s),
            ),
          ),
        ),
      ],
    );
  }
}
