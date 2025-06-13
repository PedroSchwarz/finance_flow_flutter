import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:flutter/material.dart';

class GroupTransactionsList extends StatelessWidget {
  const GroupTransactionsList({
    required this.transactions,
    required this.onRefresh,
    required this.dateSort,
    required this.onDateSortChanged,
    super.key,
  });

  final List<GroupTransactionResponse> transactions;
  final Future<void> Function() onRefresh;
  final GroupTransactionDateSort dateSort;
  final ValueChanged<GroupTransactionDateSort?> onDateSortChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppSpacing.m, left: AppSpacing.s, right: AppSpacing.s),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Movements', style: theme.textTheme.titleLarge),
              DropdownButton<GroupTransactionDateSort>(
                icon: const Padding(padding: EdgeInsets.only(left: AppSpacing.s), child: Icon(Icons.sort)),
                isDense: true,
                value: dateSort,
                items:
                    GroupTransactionDateSort.values.map((sort) {
                      return DropdownMenuItem(
                        value: sort,
                        child: Text(switch (sort) {
                          GroupTransactionDateSort.newest => 'Newest',
                          GroupTransactionDateSort.oldest => 'Oldest',
                        }),
                      );
                    }).toList(),
                onChanged: onDateSortChanged,
              ),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.separated(
              padding: const EdgeInsets.only(top: AppSpacing.s, bottom: AppSpacing.max),
              itemCount: transactions.length,
              itemBuilder: (context, position) {
                final transaction = transactions[position];
                return GroupTransactionItem(transaction: transaction);
              },
              separatorBuilder: (_, __) => const Divider(),
            ),
          ),
        ),
      ],
    );
  }
}
