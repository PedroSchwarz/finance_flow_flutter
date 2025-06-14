import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({required this.group, required this.position, required this.isEditable, required this.onTap, required this.onEdit, super.key});

  final GroupResponse group;
  final int position;
  final bool isEditable;
  final VoidCallback onTap;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.xs)),
          margin: EdgeInsets.zero,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppSpacing.xs),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.s),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(group.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.titleLarge),
                      const Gap(AppSpacing.xs),
                      Text(
                        group.description.isEmpty ? 'No description.' : group.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const Gap(AppSpacing.s),
                      Text(
                        CurrencyInputFormatter.getFormatted(group.balance),
                        style: theme.textTheme.headlineLarge?.copyWith(color: group.balance.isNegative ? Colors.red : theme.colorScheme.primary),
                      ),
                    ],
                  ),
                  const Gap(AppSpacing.s),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: group.members.length,
                      itemBuilder: (context, index) {
                        final member = group.members[index];
                        return CircleAvatar(child: Text(member.initials));
                      },
                      separatorBuilder: (context, index) => const Gap(AppSpacing.xs),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isEditable)
          Transform.translate(
            offset: const Offset(AppSpacing.s, -AppSpacing.s),
            child: IconButton.filled(onPressed: onEdit, icon: const Icon(Icons.edit)),
          ),
      ],
    );
  }
}
