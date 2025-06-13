import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/auth/auth.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/groups/ui/view/components/group_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GroupsList extends StatelessWidget {
  const GroupsList({
    required this.groups,
    required this.currentUser,
    required this.onSelected,
    required this.onEdit,
    required this.onRefresh,
    super.key,
  });

  final List<GroupResponse> groups;
  final UserData currentUser;
  final void Function(GroupResponse) onSelected;
  final Future<void> Function(GroupResponse) onEdit;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(AppSpacing.m),
        Padding(padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s), child: Text('Groups', style: theme.textTheme.headlineSmall)),
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.separated(
              padding: const EdgeInsets.only(top: AppSpacing.s, left: AppSpacing.s, right: AppSpacing.s, bottom: AppSpacing.max),
              itemCount: groups.length,
              itemBuilder: (context, position) {
                final group = groups[position];

                return GroupItem(
                  group: group,
                  position: position,
                  isEditable: group.owner.id == currentUser.id,
                  onTap: () => onSelected(group),
                  onEdit: () => onEdit(group),
                );
              },
              separatorBuilder: (context, index) => const Gap(AppSpacing.s),
            ),
          ),
        ),
      ],
    );
  }
}
