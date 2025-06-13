import 'package:finance_flow/app/app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardBalanceSection extends StatelessWidget {
  const DashboardBalanceSection({required this.balance, required this.onTap, super.key});

  final double balance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: AppSpacing.s,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Balance is', style: theme.textTheme.headlineSmall),
              Text(
                NumberFormat.simpleCurrency().format(balance),
                style: theme.textTheme.displayLarge?.copyWith(color: balance.isNegative ? theme.colorScheme.error : theme.colorScheme.primary),
              ),
            ],
          ),
        ),
        IconButton.filled(tooltip: 'Add Transactions', onPressed: onTap, padding: const EdgeInsets.all(AppSpacing.s), icon: const Icon(Icons.repeat)),
      ],
    );
  }
}
