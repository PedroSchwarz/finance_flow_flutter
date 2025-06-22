import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/app/design_system/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({required this.initials, required this.title, required this.subtitle, required this.onSignOut, super.key});

  final String initials;
  final String title;
  final String subtitle;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.s, AppSpacing.s, AppSpacing.s, 0),
          child: Column(
            spacing: AppSpacing.s,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: AppLogo(size: 50)),
              Row(
                spacing: AppSpacing.s,
                children: [
                  CircleAvatar(radius: 30, child: Text(initials, style: theme.textTheme.headlineSmall)),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(title, style: theme.textTheme.headlineSmall), Text(subtitle, style: theme.textTheme.labelSmall)],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Divider(),
              FilledButton.tonal(onPressed: onSignOut, child: const Text('Sign Out')),
            ],
          ),
        ),
      ),
    );
  }
}
