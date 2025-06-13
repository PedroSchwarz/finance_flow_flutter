import 'package:finance_flow/app/app.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GroupLoadingTransactionsList extends StatelessWidget {
  const GroupLoadingTransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: AppSpacing.s, left: AppSpacing.s, right: AppSpacing.s, bottom: AppSpacing.max),
      itemCount: 3,
      itemBuilder: (context, position) {
        return const AppSkeleton(isLoading: true, child: SizedBox(height: 100, width: double.infinity));
      },
      separatorBuilder: (_, __) => const Gap(AppSpacing.s),
    );
  }
}
