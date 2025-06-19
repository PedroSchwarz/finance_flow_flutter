import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/users/users.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InviteUsersSheet extends StatefulWidget {
  const InviteUsersSheet({required this.users, required this.selectedUsersIds, required this.isUpdating, required this.onPressed, super.key});

  final List<UserResponse> users;
  final List<String> selectedUsersIds;
  final bool isUpdating;
  final Function(List<String>) onPressed;

  @override
  State<InviteUsersSheet> createState() => _InviteUsersSheetState();
}

class _InviteUsersSheetState extends State<InviteUsersSheet> {
  List<UserResponse> _users = [];
  List<String> _selectedIds = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _users = widget.users;
        _selectedIds = widget.selectedUsersIds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: context.pop, icon: const Icon(Icons.close)), automaticallyImplyLeading: false),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpacing.s,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  AppSliverHeaderWrapper.floating(
                    padding: 0,
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.s),
                      color: theme.scaffoldBackgroundColor,
                      child: LiquidGlassCard(
                        borderRadius: BorderRadius.circular(AppSpacing.xs),
                        isTransparent: true,
                        child: AppTextField(
                          label: 'Search Users',
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                _users = widget.users;
                              });
                            } else {
                              setState(() {
                                _users =
                                    widget.users
                                        .where(
                                          (element) =>
                                              element.firstName.toLowerCase().contains(value.toLowerCase()) ||
                                              element.lastName.toLowerCase().contains(value.toLowerCase()) ||
                                              element.email.toLowerCase().contains(value.toLowerCase()),
                                        )
                                        .toList();
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, position) {
                      final user = _users[position];
                      final isSelected = _selectedIds.contains(user.id);

                      return CheckboxListTile(
                        value: isSelected,
                        title: Text(user.completeName),
                        subtitle: Text(user.email),
                        secondary: CircleAvatar(child: Text(user.initials)),
                        checkboxShape: const CircleBorder(),
                        checkboxScaleFactor: 1.2,
                        selected: isSelected,
                        onChanged: (value) => toggleInvite(user.id, value: value),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
              child: FilledButton(onPressed: () => widget.onPressed(_selectedIds), child: Text(widget.isUpdating ? 'Update' : 'Invite')),
            ),
          ],
        ),
      ),
    );
  }

  void toggleInvite(String userId, {required bool? value}) {
    if (value == true) {
      setState(() {
        _selectedIds = [..._selectedIds, userId];
      });
    } else {
      setState(() {
        _selectedIds = _selectedIds.where((id) => id != userId).toList();
      });
    }
  }
}
