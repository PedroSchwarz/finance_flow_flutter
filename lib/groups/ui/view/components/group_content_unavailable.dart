import 'package:finance_flow/app/app.dart';
import 'package:flutter/material.dart';

class GroupContentUnavailable extends StatelessWidget {
  const GroupContentUnavailable({required this.onRefresh, super.key});

  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.s),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('No groups create yet.', style: theme.textTheme.titleLarge, textAlign: TextAlign.center),
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.titleMedium,
                        children: [
                          const TextSpan(text: 'To create a new group, tap the'),
                          TextSpan(text: ' + ', style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary)),
                          const TextSpan(text: 'button or be invited to an existing one.'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
