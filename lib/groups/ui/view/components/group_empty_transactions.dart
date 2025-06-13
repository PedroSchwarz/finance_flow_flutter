import 'package:flutter/material.dart';

class GroupEmptyTransactions extends StatelessWidget {
  const GroupEmptyTransactions({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(child: Text(message, textAlign: TextAlign.center, style: theme.textTheme.bodyLarge));
  }
}
