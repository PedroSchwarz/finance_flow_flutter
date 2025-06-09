import 'package:flutter/material.dart';

class DashboardInvitesButton extends StatelessWidget {
  const DashboardInvitesButton({required this.count, required this.onPressed, super.key});

  final int count;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      textStyle: Theme.of(context).textTheme.labelLarge,
      offset: const Offset(-5, 0),
      count: count,
      child: IconButton(onPressed: onPressed, icon: const Icon(Icons.mail_outline)),
    );
  }
}
