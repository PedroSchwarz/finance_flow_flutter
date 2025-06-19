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

    return LiquidGlassCard(
      padding: const EdgeInsets.all(AppSpacing.s),
      borderRadius: BorderRadius.circular(AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppSpacing.s,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Balance is', style: theme.textTheme.headlineSmall),
                Text(
                  NumberFormat.simpleCurrency().format(balance),
                  style: theme.textTheme.displayLarge?.copyWith(
                    color: balance == 0 ? theme.colorScheme.onSurface : (balance.isNegative ? theme.colorScheme.error : Colors.green),
                  ),
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
            tooltip: 'Add Transactions',
            onPressed: onTap,
            padding: const EdgeInsets.all(AppSpacing.s),
            icon: const Icon(Icons.repeat),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
