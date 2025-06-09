import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/dashboard/ui/cubit/dashboard_cubit.dart';
import 'package:finance_flow/dashboard/ui/view/components/dashboard_invites_button.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/invites/invites.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String routeName = 'dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final bloc = getIt<DashboardCubit>();

  @override
  void initState() {
    super.initState();
    bloc.load();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder:
            (_, __) => [
              SliverAppBar.medium(
                title: const Text('Dashboard'),
                actions: [
                  BlocSelector<DashboardCubit, DashboardState, List<InviteResponse>>(
                    bloc: bloc,
                    selector: (state) => state.invites,
                    builder: (context, invites) {
                      return DashboardInvitesButton(
                        count: invites.length,
                        onPressed: () async {
                          if (context.mounted) {
                            await context.pushNamed(InvitesScreen.routeName);
                            await Future.wait([bloc.loadGroups(), bloc.loadInvites()]);
                          }
                        },
                      );
                    },
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size(0, AppSpacing.s),
                  child: BlocSelector<DashboardCubit, DashboardState, bool>(
                    bloc: bloc,
                    selector: (state) => state.isLoading || state.isRefreshing,
                    builder: (context, isLoading) => isLoading ? const LinearProgressIndicator() : const SizedBox.shrink(),
                  ),
                ),
              ),
              BlocBuilder<DashboardCubit, DashboardState>(
                bloc: bloc,
                buildWhen: (previous, current) => previous.balance != current.balance,
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.s),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: AppSpacing.s,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Your Balance is', style: theme.textTheme.headlineSmall),
                                Text(
                                  state.balanceString,
                                  style: theme.textTheme.displayLarge?.copyWith(
                                    color: state.balance.isNegative ? theme.colorScheme.error : theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton.filled(
                            onPressed: () async {
                              if (context.mounted) {
                                final _ = await context.pushNamed(TransactionsScreen.routeName);
                                await bloc.refresh();
                              }
                            },
                            padding: const EdgeInsets.all(AppSpacing.s),
                            icon: const Icon(Icons.repeat),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
        body: BlocBuilder<DashboardCubit, DashboardState>(
          bloc: bloc,
          buildWhen:
              (previous, current) =>
                  previous.isLoading != current.isLoading || //
                  previous.groups != current.groups,
          builder: (context, state) {
            if (state.isLoading) {
              return const GroupListLoading();
            }

            if (state.groups.isEmpty) {
              return GroupContentUnavailable(onRefresh: bloc.refresh);
            }

            return GroupsList(
              groups: state.groups,
              currentUser: bloc.currentUser,
              onSelected: (group) {
                context.goNamed(GroupDetailsScreen.routeName, pathParameters: {'id': group.id}, queryParameters: {'name': group.name});
              },
              onEdit: (group) async {
                if (context.mounted) {
                  final result = await context.pushNamed<bool>(CreateGroupScreen.routeName, queryParameters: {'id': group.id});

                  if (result ?? false) {
                    bloc.loadGroups();
                  }
                }
              },
              onRefresh: bloc.refresh,
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Create Group'),
        icon: const Icon(Icons.add),
        onPressed: () async {
          if (context.mounted) {
            final result = await context.pushNamed<bool>(CreateGroupScreen.routeName);

            if (result ?? false) {
              bloc.loadGroups();
            }
          }
        },
      ),
    );
  }
}
