import 'dart:ui';

import 'package:finance_flow/app/app.dart';
import 'package:flutter/material.dart';

class AppSliverAppBar extends StatelessWidget {
  const AppSliverAppBar({required this.title, required this.isLoading, this.leading, this.actions, super.key});

  final String title;
  final bool isLoading;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar.medium(
      backgroundColor: Colors.transparent,
      title: Text(title),
      leading: leading,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: FlexibleSpaceBar(
            background: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s, vertical: AppSpacing.xs),
              child: Text(title, style: theme.appBarTheme.titleTextStyle),
            ),
          ),
        ),
      ),
      actions: actions,
      bottom: PreferredSize(preferredSize: const Size(0, AppSpacing.s), child: isLoading ? const LinearProgressIndicator() : const SizedBox.shrink()),
    );
  }
}
