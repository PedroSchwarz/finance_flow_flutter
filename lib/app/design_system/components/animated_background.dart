import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({this.hasAnimatedShapes = false, super.key});

  final bool hasAnimatedShapes;

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
    return AnimatedBuilder(
      animation: _backgroundAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: const [
                    Color.fromARGB(255, 80, 105, 221),
                    Color.fromARGB(255, 107, 58, 157),
                    Color.fromARGB(255, 183, 69, 196),
                    Color.fromARGB(255, 226, 62, 84),
                  ],
                  stops: [
                    0.0 + _backgroundAnimation.value * 0.3,
                    0.3 + _backgroundAnimation.value * 0.3,
                    0.7 + _backgroundAnimation.value * 0.3,
                    1.0,
                  ],
                ),
              ),
              child:
                  widget.hasAnimatedShapes
                      ? Stack(
                        children: [
                          AnimatedBackgroundShape(
                            top: 100 + math.sin(_backgroundAnimation.value * 2 * math.pi) * 50,
                            left: 50 + math.cos(_backgroundAnimation.value * 2 * math.pi) * 30,
                            size: 80,
                            color: Colors.white.withValues(alpha: 0.1),
                          ),
                          AnimatedBackgroundShape(
                            top: 300 + math.cos(_backgroundAnimation.value * 1.5 * math.pi) * 40,
                            right: 80 + math.sin(_backgroundAnimation.value * 1.5 * math.pi) * 25,
                            size: 120,
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                          AnimatedBackgroundShape(
                            bottom: 200 + math.sin(_backgroundAnimation.value * 2.5 * math.pi) * 60,
                            left: 200 + math.cos(_backgroundAnimation.value * 2.5 * math.pi) * 40,
                            size: 60,
                            color: Colors.white.withValues(alpha: 0.12),
                          ),
                        ],
                      )
                      : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}

class AnimatedBackgroundShape extends StatefulWidget {
  const AnimatedBackgroundShape({required this.size, required this.color, this.top, this.bottom, this.left, this.right, super.key});

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final Color color;

  @override
  State<AnimatedBackgroundShape> createState() => _AnimatedBackgroundShapeState();
}

class _AnimatedBackgroundShapeState extends State<AnimatedBackgroundShape> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));
    _pulseController.repeat(reverse: true);
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
                borderRadius: BorderRadius.circular(widget.size / 4),
                boxShadow: [BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 20, spreadRadius: 5)],
              ),
            ),
          ),
        );
      },
    );
  }
}
