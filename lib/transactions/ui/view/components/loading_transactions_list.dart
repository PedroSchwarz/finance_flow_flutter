import 'package:finance_flow/app/app.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoadingTransactionsList extends StatelessWidget {
  const LoadingTransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(AppSpacing.s, AppSpacing.s, AppSpacing.s, AppSpacing.max),
      itemCount: 5,
      itemBuilder: (context, position) {
        return const AppSkeleton(isLoading: true, child: SizedBox(height: 150, width: double.infinity));
      },
      separatorBuilder: (context, index) => const Gap(AppSpacing.s),
    );
  }
}
