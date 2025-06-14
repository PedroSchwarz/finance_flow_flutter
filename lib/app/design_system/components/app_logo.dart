import 'package:finance_flow/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({this.color, this.size, super.key});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: theme.brightness == Brightness.light ? 0.05 : 0.35),
            borderRadius: BorderRadius.circular(AppSpacing.m),
          ),
        ),
        SvgPicture.asset('assets/logo.svg', height: size, width: size),
      ],
    );
  }
}
