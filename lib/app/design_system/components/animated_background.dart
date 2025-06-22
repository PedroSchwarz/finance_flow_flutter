import 'package:finance_flow/app/design_system/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({this.hasShapes = false, this.isBorder = true, super.key});

  final bool hasShapes;
  final bool isBorder;

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _backgroundController;
  late Animation<double> _backgroundAnimation;

  @override
  void initState() {
    super.initState();
    _backgroundController = AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _backgroundAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _backgroundController, curve: Curves.linear));
    _backgroundController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        AnimatedBuilder(
          animation: _backgroundAnimation,
          builder: (context, child) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: const [Color(0xFF667eea), Color(0xFF764ba2), Color(0xFFf093fb), Color(0xFFf5576c)],
                  stops: [
                    0.0 + _backgroundAnimation.value * 0.3,
                    0.3 + _backgroundAnimation.value * 0.3,
                    0.7 + _backgroundAnimation.value * 0.3,
                    1.0,
                  ],
                ),
              ),
            );
          },
        ),
        if (widget.isBorder)
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.all(AppSpacing.xxs),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSpacing.l), color: theme.scaffoldBackgroundColor),
          ),
        if (widget.hasShapes)
          AnimatedBuilder(
            animation: _backgroundAnimation,
            builder: (context, child) {
              return Stack(
                children: [
                  AnimatedBackgroundShape(
                    top: -200,
                    right: -100,
                    size: 400,
                    borderRadius: BorderRadius.circular(10000),
                    color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                  ),
                  AnimatedBackgroundShape(
                    top: 140,
                    right: -100,
                    size: 200,
                    borderRadius: BorderRadius.circular(10000),
                    color: Colors.red.withValues(alpha: 0.3),
                    minScale: 0.6,
                    maxScale: 1.1,
                    animationDelay: const Duration(milliseconds: 2500),
                  ),
                  AnimatedBackgroundShape(
                    top: 100,
                    right: -40,
                    size: 160,
                    borderRadius: BorderRadius.circular(10000),
                    color: Colors.pink.withValues(alpha: 0.3),
                    minScale: 1,
                    animationDelay: const Duration(milliseconds: 3500),
                  ),
                ],
              );
            },
          ),
      ],
    );
  }
}

class AnimatedBackgroundShape extends StatefulWidget {
  const AnimatedBackgroundShape({
    required this.size,
    required this.color,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.borderRadius,
    this.minScale,
    this.maxScale,
    this.animationDelay,
    super.key,
  });

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final Color color;
  final BorderRadius? borderRadius;
  final double? minScale;
  final double? maxScale;
  final Duration? animationDelay;

  @override
  State<AnimatedBackgroundShape> createState() => _AnimatedBackgroundShapeState();
}

class _AnimatedBackgroundShapeState extends State<AnimatedBackgroundShape> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _pulseAnimation = Tween<double>(
      begin: widget.minScale ?? 0.4,
      end: widget.maxScale ?? 1.2,
    ).animate(CurvedAnimation(parent: _pulseController, curve: Curves.decelerate));

    if (widget.animationDelay != null) {
      Future.delayed(widget.animationDelay!).then((value) => _pulseController.repeat(reverse: true));
    } else {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Positioned(
          top: widget.top,
          bottom: widget.bottom,
          left: widget.left,
          right: widget.right,
          child: Transform.scale(
            scale: _pulseAnimation.value,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: widget.borderRadius ?? BorderRadius.circular(widget.size / 4),
                boxShadow: [BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 20, spreadRadius: 5)],
              ),
            ),
          ),
        );
      },
    );
  }
}
