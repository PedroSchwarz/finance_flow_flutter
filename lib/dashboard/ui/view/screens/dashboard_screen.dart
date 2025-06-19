import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/dashboard/dashboard.dart';
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
    return Scaffold(
      drawer: DashboardDrawer(
        initials: bloc.currentUser.initials,
        title: bloc.currentUser.completeName,
        subtitle: bloc.currentUser.email,
        onSignOut: bloc.signOut,
      ),
      body: Stack(
        children: [
          const AnimatedBackground(hasAnimatedShapes: true),
          NestedScrollView(
            headerSliverBuilder:
                (_, __) => [
                  BlocSelector<DashboardCubit, DashboardState, bool>(
                    bloc: bloc,
                    selector: (state) => state.isLoading || state.isRefreshing,
                    builder:
                        (context, isLoading) => AppSliverAppBar(
                          title: 'Dashboard',
                          isLoading: isLoading,
                          actions: [
                            BlocSelector<DashboardCubit, DashboardState, List<InviteResponse>>(
                              bloc: bloc,
                              selector: (state) => state.invites,
                              builder: (context, invites) {
                                return DashboardInvitesButton(
                                  count: invites.length,
                                  onPressed: () async {
                                    if (context.mounted) {
                                      final _ = await context.pushNamed(InvitesScreen.routeName);
                                      bloc.refresh();
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                  ),
                  BlocBuilder<DashboardCubit, DashboardState>(
                    bloc: bloc,
                    buildWhen: (previous, current) => previous.balance != current.balance,
                    builder: (context, state) {
                      return SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.s),
                          child: DashboardBalanceSection(
                            balance: state.balance,
                            onTap: () async {
                              if (context.mounted) {
                                final _ = await context.pushNamed(TransactionsScreen.routeName);
                                await bloc.refresh();
                              }
                            },
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
                  onSelected: (group) async {
                    if (context.mounted) {
                      final _ = await context.pushNamed(
                        GroupDetailsScreen.routeName,
                        pathParameters: {'id': group.id},
                        queryParameters: {'name': group.name},
                      );
                      bloc.refresh();
                    }
                  },
                  onEdit: (group) async {
                    if (context.mounted) {
                      final result = await context.pushNamed<bool>(CreateGroupScreen.routeName, queryParameters: {'id': group.id});

                      if (result ?? false) {
                        bloc.refresh();
                      }
                    }
                  },
                  onRefresh: bloc.refresh,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: LiquidGlassCard(
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          label: const Text('Create Group'),
          icon: const Icon(Icons.add),
          onPressed: () async {
            if (context.mounted) {
              final result = await context.pushNamed<bool>(CreateGroupScreen.routeName);

              if (result ?? false) {
                bloc.refresh();
              }
            }
          },
        ),
      ),
    );
  }
}
