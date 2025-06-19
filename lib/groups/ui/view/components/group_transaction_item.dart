import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter/material.dart';

class GroupTransactionItem extends StatelessWidget {
  const GroupTransactionItem({required this.transaction, super.key});

  final GroupTransactionResponse transaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LiquidGlassCard(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
      borderRadius: BorderRadius.circular(AppSpacing.xs),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 5,
              color: switch (transaction.type) {
                TransactionType.expense => Colors.red,
                TransactionType.income => Colors.green,
              },
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s),
          child: Row(
            spacing: AppSpacing.s,
            children: [
              CircleAvatar(
                radius: 25,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(switch (transaction.type) {
                      TransactionType.expense => 'Withdrawal of',
                      TransactionType.income => 'Deposit of',
                    }, style: theme.textTheme.titleMedium),
                    Text(
                      CurrencyInputFormatter.getFormatted(transaction.amount),
                      style: theme.textTheme.displaySmall?.copyWith(color: theme.colorScheme.primary),
                    ),
                    Text(transaction.formattedCreatedAt),
                  ],
                ),
              ),
              CircleAvatar(child: Text(transaction.owner.initials)),
            ],
          ),
        ),
      ),
    );
  }
}
