import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/invites/invites.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InviteItem extends StatelessWidget {
  const InviteItem({required this.invite, required this.onAccepted, required this.onRejected, super.key});

  final InviteResponse invite;
  final Function(InviteResponse) onAccepted;
  final Function(InviteResponse) onRejected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
      leading:
          invite.status == InviteStatus.accepted
              ? CircleAvatar(
                backgroundColor: theme.scaffoldBackgroundColor,
                child: const Icon(Icons.check, color: Colors.green, size: AppSpacing.xxm),
              )
              : null,
      title: Text(invite.group.name),
      subtitle: Text('Invited by: ${invite.from.completeName}'),
      trailing:
          invite.status == InviteStatus.pending
              ? Row(
                spacing: AppSpacing.xs,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.outlined(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      onAccepted(invite);
                    },
                    icon: const Icon(Icons.check),
                    color: Colors.green,
                    style: IconButton.styleFrom(side: const BorderSide(color: Colors.green)),
                  ),
                  IconButton.outlined(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      onRejected(invite);
                    },
                    color: Colors.red,
                    icon: const Icon(Icons.close),
                    style: IconButton.styleFrom(side: const BorderSide(color: Colors.red)),
                  ),
                ],
              )
              : null,
    );
  }
}
