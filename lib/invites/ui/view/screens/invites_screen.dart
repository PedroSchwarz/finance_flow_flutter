import 'package:finance_flow/app/app.dart';
import 'package:finance_flow/invites/ui/cubit/invites_cubit.dart';
import 'package:finance_flow/invites/ui/view/components/invite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class InvitesScreen extends StatefulWidget {
  const InvitesScreen({super.key});

  static const String routeName = 'invites';

  @override
  State<InvitesScreen> createState() => _InvitesScreenState();
}

class _InvitesScreenState extends State<InvitesScreen> {
  final bloc = getIt<InvitesCubit>();

  @override
  void initState() {
    super.initState();
    bloc.load();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),
          NestedScrollView(
            headerSliverBuilder:
                (_, __) => [
                  BlocSelector<InvitesCubit, InvitesState, bool>(
                    bloc: bloc,
                    selector: (state) => state.isLoading || state.isRefreshing,
                    builder: (context, isLoading) {
                      return AppSliverAppBar(title: 'Invites', isLoading: isLoading);
                    },
                  ),
                ],
            body: BlocBuilder<InvitesCubit, InvitesState>(
              bloc: bloc,
              buildWhen:
                  (previous, current) =>
                      previous.invites != current.invites || //
                      previous.isLoading != current.isLoading,
              builder: (context, state) {
                if (state.isLoading) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(AppSpacing.s),
                    itemCount: 5,
                    itemBuilder: (context, position) {
                      return const AppSkeleton(isLoading: true, child: SizedBox(height: 100, width: double.infinity));
                    },
                    separatorBuilder: (_, __) => const Gap(AppSpacing.s),
                  );
                }

                if (state.invites.isEmpty) {
                  return Center(child: Text('No invites for now.', style: theme.textTheme.bodyLarge));
                }

                return ListView.separated(
                  padding: const EdgeInsets.only(top: AppSpacing.s, bottom: AppSpacing.max),
                  itemCount: state.invites.length,
                  itemBuilder: (context, position) {
                    final invite = state.invites[position];
                    return InviteItem(invite: invite, onAccepted: bloc.acceptInvite, onRejected: bloc.rejectInvite);
                  },
                  separatorBuilder: (_, __) => const Gap(AppSpacing.s),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
