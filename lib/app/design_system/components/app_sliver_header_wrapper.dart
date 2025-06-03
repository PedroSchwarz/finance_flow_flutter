import 'package:finance_flow/app/design_system/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class AppSliverHeaderWrapper extends StatelessWidget {
  const AppSliverHeaderWrapper.floating({required this.child, this.padding = AppSpacing.s, this.backgroundColor, this.maxSize = 90, super.key})
    : floating = true,
      pinned = false;

  const AppSliverHeaderWrapper.pinned({required this.child, this.padding = AppSpacing.s, this.backgroundColor, this.maxSize = 90, super.key})
    : floating = false,
      pinned = true;

  final Widget child;
  final double padding;
  final Color? backgroundColor;
  final double maxSize;

  final bool floating;
  final bool pinned;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: floating,
      pinned: pinned,
      delegate: _AppPersistentHeaderDelegate(
        maxSize: maxSize,
        child: DecoratedBox(decoration: const BoxDecoration(), child: Padding(padding: EdgeInsets.all(padding), child: child)),
      ),
    );
  }
}

class _AppPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _AppPersistentHeaderDelegate({required this.maxSize, required this.child});

  final double maxSize;
  final Widget child;

  @override
  double get maxExtent => maxSize;

  @override
  double get minExtent => maxSize;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }
}
