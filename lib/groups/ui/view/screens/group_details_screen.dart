import 'package:calendar_pager/calendar_pager.dart';
import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class GroupDetailsScreen extends StatefulWidget {
  const GroupDetailsScreen({required this.id, required this.name, super.key});

  static const String routeName = 'group';

  final String id;
  final String name;

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  final bloc = getIt<GroupDetailsCubit>();
  late final String title;

  @override
  void initState() {
    super.initState();
    title = widget.name;
    bloc.load(groupId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<GroupDetailsCubit, GroupDetailsState>(
      bloc: bloc,
      listenWhen: (previous, current) => previous.shouldGoBack != current.shouldGoBack,
      listener: _listenNavigationFlow,
      child: BlocListener<GroupDetailsCubit, GroupDetailsState>(
        bloc: bloc,
        listenWhen: (previous, current) => previous.showLeaveDialog != current.showLeaveDialog,
        listener: _listenLeaveDialog,
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (_, __) {
              return [
                SliverAppBar.medium(
                  title: BlocSelector<GroupDetailsCubit, GroupDetailsState, String?>(
                    bloc: bloc,
                    selector: (state) => state.group?.name,
                    builder: (context, name) {
                      return Text(name ?? title);
                    },
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size(0, AppSpacing.s),
                    child: BlocSelector<GroupDetailsCubit, GroupDetailsState, bool>(
                      bloc: bloc,
                      selector: (state) => state.isLoading || state.isRefreshing,
                      builder: (context, isLoading) => isLoading ? const LinearProgressIndicator() : const SizedBox.shrink(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<GroupDetailsCubit, GroupDetailsState>(
                    bloc: bloc,
                    buildWhen: (previous, current) => previous.group != current.group,
                    builder: (context, state) {
                      final group = state.group;
                      final isOwner = group?.owner.id == bloc.currentUser.id;

                      return ExpansionTile(
                        title: Text('Details', style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.secondary)),
                        shape: const RoundedRectangleBorder(),
                        tilePadding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: AppSpacing.xs,
                              children: [
                                AppSkeleton(
                                  isLoading: group == null,
                                  child: Row(
                                    spacing: AppSpacing.xs,
                                    children: [
                                      const Text('Actions:'),
                                      IconButton.filledTonal(
                                        color: theme.colorScheme.onPrimaryContainer,
                                        onPressed:
                                            isOwner
                                                ? () async {
                                                  if (context.mounted) {
                                                    final result = await context.pushNamed<bool>(
                                                      CreateGroupScreen.routeName,
                                                      queryParameters: {'id': group!.id},
                                                    );

                                                    if (result ?? false) {
                                                      bloc.loadGroup(groupId: group.id);
                                                    }
                                                  }
                                                }
                                                : null,
                                        icon: const Icon(Icons.edit_outlined),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton.outlined(
                                  color: Colors.red,
                                  tooltip: 'Leave Group',
                                  onPressed: isOwner ? null : bloc.toggleLeaveDialog,
                                  icon: const Icon(Icons.exit_to_app),
                                ),
                              ],
                            ),
                          ),
                          const Gap(AppSpacing.xxs),
                          const Divider(),
                          const Gap(AppSpacing.xs),
                          AppSkeleton(
                            isLoading: group == null,
                            child: SizedBox(
                              height: 40,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
                                itemCount: group?.members.length ?? 0,
                                itemBuilder: (context, position) {
                                  final member = group!.members[position];

                                  if (position == 0) {
                                    return Row(spacing: AppSpacing.s, children: [const Text('Members:'), CircleAvatar(child: Text(member.initials))]);
                                  }
                                  return CircleAvatar(child: Text(member.initials));
                                },
                                separatorBuilder: (__, _) => const Gap(AppSpacing.xs),
                              ),
                            ),
                          ),
                          const Gap(AppSpacing.s),
                        ],
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: CalendarPagerViewConstants.collapsedHeight,
                    child: CalendarPagerView(
                      theme: CalendarPagerTheme.from(
                        background: theme.scaffoldBackgroundColor,
                        accent: theme.colorScheme.primary,
                        headerTitle: theme.textTheme.headlineLarge!,
                        itemBorder: theme.colorScheme.primary,
                        onAccent: theme.colorScheme.onPrimary,
                        hasShadow: false,
                      ),
                      hasHeader: false,
                      onDateSelected: bloc.updateSelectedDate,
                    ),
                  ),
                ),
              ];
            },
            body: BlocBuilder<GroupDetailsCubit, GroupDetailsState>(
              bloc: bloc,
              builder: (context, state) {
                return const Text('No items for now.');
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              if (context.mounted) {
                // final result = await context.pushNamed<bool>(CreateTaskScreen.routeName, pathParameters: {'id': widget.id});

                // if (result ?? false) {
                //   bloc.load(groupId: widget.id);
                // }
              }
            },
            label: const Text('Create Something'),
            icon: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  void _listenLeaveDialog(BuildContext context, GroupDetailsState state) {
    if (state.showLeaveDialog) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Leave Group?'),
            actions: [
              TextButton(onPressed: bloc.toggleLeaveDialog, child: const Text('Cancel', textAlign: TextAlign.end)),
              TextButton(onPressed: bloc.leaveGroup, child: const Text('Leave', textAlign: TextAlign.end)),
            ],
          );
        },
      );
    } else {
      context.pop();
    }
  }

  void _listenNavigationFlow(BuildContext context, GroupDetailsState state) {
    if (state.shouldGoBack) {
      context.pop();
    }
  }
}
