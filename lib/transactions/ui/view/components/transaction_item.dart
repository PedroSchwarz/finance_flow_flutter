import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({required this.transaction, required this.onDelete, super.key});

  final TransactionResponse transaction;
  final Future<void> Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: ValueKey(transaction.title),
      direction: DismissDirection.startToEnd,
      dismissThresholds: const {DismissDirection.startToEnd: 0.6},
      background: Container(
        padding: const EdgeInsets.all(AppSpacing.m),
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(color: Colors.red),
        child: Column(
          spacing: AppSpacing.xxxs,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.delete_outline, color: Colors.white, size: 32),
            Text('Delete', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white)),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        HapticFeedback.heavyImpact();
        await onDelete();
        return false;
      },
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: switch (transaction.type) {
                  TransactionType.expense => Colors.red,
                  TransactionType.income => Colors.green,
                },
                width: 5,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s, vertical: AppSpacing.xs),
            child: Row(
              spacing: AppSpacing.s,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(transaction.title, style: theme.textTheme.titleLarge),
                      const Gap(AppSpacing.xxs),
                      Text(
                        transaction.description ?? 'No description',
                        style: theme.textTheme.bodyLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(AppSpacing.s),
                      Text(
                        CurrencyInputFormatter.getFormatted(transaction.amount),
                        style: theme.textTheme.displaySmall?.copyWith(color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundColor: theme.colorScheme.surfaceContainer,
                  child: Icon(
                    color: switch (transaction.type) {
                      TransactionType.expense => Colors.red,
                      TransactionType.income => Colors.green,
                    },
                    switch (transaction.type) {
                      TransactionType.expense => Icons.arrow_downward,
                      TransactionType.income => Icons.arrow_upward,
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
