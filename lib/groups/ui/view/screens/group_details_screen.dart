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
          resizeToAvoidBottomInset: false,
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
                    buildWhen:
                        (previous, current) =>
                            previous.isLoading != current.isLoading || //
                            previous.group != current.group,
                    builder: (context, state) {
                      final group = state.group;

                      if (group == null) {
                        return const SizedBox.shrink();
                      }

                      return Padding(
                        padding: const EdgeInsets.all(AppSpacing.s),
                        child: AppSkeleton(
                          isLoading: state.isLoading,
                          child: Text(
                            CurrencyInputFormatter.getFormatted(group.balance),
                            style: theme.textTheme.displayMedium?.copyWith(color: group.balance < 0 ? theme.colorScheme.error : Colors.green),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<GroupDetailsCubit, GroupDetailsState>(
                    bloc: bloc,
                    buildWhen:
                        (previous, current) =>
                            previous.group != current.group || //
                            previous.selectedMember != current.selectedMember,
                    builder: (context, state) {
                      final group = state.group;
                      final isOwner = group?.owner.id == bloc.currentUser.id;

                      if (group == null) {
                        return const Padding(
                          padding: EdgeInsets.all(AppSpacing.s),
                          child: AppSkeleton(isLoading: true, child: SizedBox(height: 150, width: double.infinity)),
                        );
                      }

                      return Column(
                        spacing: AppSpacing.xxs,
                        children: [
                          const Gap(AppSpacing.xs),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: AppSpacing.xs,
                              children: [
                                Row(
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
                                                    queryParameters: {'id': group.id},
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
                                IconButton.outlined(
                                  color: Colors.red,
                                  tooltip: 'Leave Group',
                                  onPressed: isOwner ? null : bloc.toggleLeaveDialog,
                                  icon: const Icon(Icons.exit_to_app),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            height: 68,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                              scrollDirection: Axis.horizontal,
                              itemCount: group.members.length,
                              itemBuilder: (context, position) {
                                final member = group.members[position];
                                final isSelected = state.selectedMember == member;

                                return Material(
                                  color: isSelected ? theme.colorScheme.surfaceContainer : Colors.transparent,
                                  borderRadius: BorderRadius.circular(AppSpacing.xs),
                                  child: InkWell(
                                    onTap: () {
                                      bloc.updateSelectedMember(member);
                                    },
                                    borderRadius: BorderRadius.circular(AppSpacing.xs),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 400),
                                      padding: const EdgeInsets.all(AppSpacing.xs),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: isSelected ? theme.colorScheme.primary : Colors.transparent),
                                        borderRadius: BorderRadius.circular(AppSpacing.xs),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: CircularProgressIndicator(value: state.memberDepositPercentage, color: Colors.blueAccent),
                                              ),
                                              CircleAvatar(radius: 18, child: Text(member.initials)),
                                            ],
                                          ),
                                          const Gap(AppSpacing.s),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(CurrencyInputFormatter.getFormatted(state.memberDeposit), style: theme.textTheme.titleMedium),
                                              const Gap(AppSpacing.xxxs),
                                              Text('${state.formattedMemberDepositPercentage}%', style: theme.textTheme.titleMedium),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (__, _) {
                                return const Padding(padding: EdgeInsets.symmetric(horizontal: AppSpacing.xs), child: VerticalDivider());
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ];
            },
            body: BlocBuilder<GroupDetailsCubit, GroupDetailsState>(
              bloc: bloc,
              buildWhen:
                  (previous, current) =>
                      previous.group != current.group || //
                      previous.dateSort != current.dateSort || //
                      previous.isLoading != current.isLoading,
              builder: (context, state) {
                final group = state.group;

                if (state.isLoading || group == null) {
                  return const GroupLoadingTransactionsList();
                }

                if (group.transactions.isEmpty) {
                  return const GroupEmptyTransactions(message: 'No movements made for this group yet.');
                }

                if (state.filteredTransactions.isEmpty) {
                  return const GroupEmptyTransactions(message: 'No movements found for the selected filters.');
                }

                return GroupTransactionsList(
                  transactions: state.filteredTransactions,
                  onRefresh: () async {
                    await bloc.refresh(groupId: widget.id);
                  },
                  dateSort: state.dateSort,
                  onDateSortChanged: (dateSort) {
                    bloc.updateDateSort(dateSort!);
                  },
                );
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (context.mounted) {
                final _ = await showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return BlocBuilder<GroupDetailsCubit, GroupDetailsState>(
                      bloc: bloc,
                      buildWhen:
                          (previous, current) =>
                              previous.transactionType != current.transactionType ||
                              previous.depositAmount != current.depositAmount ||
                              previous.userBalance != current.userBalance ||
                              previous.memberDeposit != current.memberDeposit,
                      builder: (context, state) {
                        return MakeGroupTransactionSheet(
                          transactionType: state.transactionType,
                          onTransactionTypeChanged: bloc.updateTransactionType,
                          depositAmount: state.depositAmount,
                          onDepositAmountChanged: bloc.updateDepositAmount,
                          memberDeposit: state.memberDeposit,
                          userBalance: state.userBalance,
                          canSubmit: state.canSubmit,
                          onSubmit: () async {
                            if (context.mounted) {
                              context.pop();
                            }
                            await bloc.makeTransaction();
                          },
                        );
                      },
                    );
                  },
                );
                bloc.resetTransactionForm();
              }
            },
            child: const Icon(Icons.repeat),
          ),
        ),
      ),
    );
  }

  void _listenLeaveDialog(BuildContext context, GroupDetailsState state) {
    if (state.showLeaveDialog) {
      showDialog(
        context: context,
        barrierDismissible: false,
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
