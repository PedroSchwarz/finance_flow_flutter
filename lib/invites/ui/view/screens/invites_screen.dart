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
      body: NestedScrollView(
        headerSliverBuilder:
            (_, __) => [
              SliverAppBar.medium(
                title: const Text('Invites'),
                bottom: PreferredSize(
                  preferredSize: const Size(0, AppSpacing.s),
                  child: BlocSelector<InvitesCubit, InvitesState, bool>(
                    bloc: bloc,
                    selector: (state) => state.isLoading || state.isRefreshing,
                    builder: (context, isLoading) => isLoading ? const LinearProgressIndicator() : const SizedBox.shrink(),
                  ),
                ),
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
                itemCount: 10,
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
                return InviteItem(invite: state.invites[position], onAccepted: bloc.acceptInvite, onRejected: bloc.rejectInvite);
              },
              separatorBuilder: (_, __) => const Divider(),
            );
          },
        ),
      ),
    );
  }
}
