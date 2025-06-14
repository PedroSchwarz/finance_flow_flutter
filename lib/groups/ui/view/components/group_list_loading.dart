import 'package:finance_flow/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class GroupListLoading extends StatelessWidget {
  const GroupListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: AppSpacing.s, left: AppSpacing.s, right: AppSpacing.s, bottom: AppSpacing.max),
      itemCount: 5,
      itemBuilder: (_, __) {
        return const AppSkeleton(isLoading: true, child: SizedBox(height: 150, width: double.infinity));
      },
      separatorBuilder: (_, __) {
        return const Gap(AppSpacing.s);
      },
    );
  }
}
