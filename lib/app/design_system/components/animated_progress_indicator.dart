import 'package:flutter/material.dart';

class AnimatedCircularProgressIndicator extends StatefulWidget {
  const AnimatedCircularProgressIndicator({super.key, required this.value, required this.color});

  final double value;
  final Color color;

  @override
  State<AnimatedCircularProgressIndicator> createState() => _AnimatedCircularProgressIndicatorState();
}

class _AnimatedCircularProgressIndicatorState extends State<AnimatedCircularProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _oldValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _updateAnimation(initial: true);
  }

  @override
  void didUpdateWidget(covariant AnimatedCircularProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _oldValue = oldWidget.value;
      _updateAnimation();
    }
  }

  void _updateAnimation({bool initial = false}) {
    _animation = Tween<double>(
      begin: initial ? 0.0 : _oldValue,
      end: widget.value,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder:
          (context, _) =>
              CircularProgressIndicator(value: _animation.value, color: widget.color, backgroundColor: widget.color.withValues(alpha: 0.2)),
    );
  }
}

class AnimatedLinearProgressIndicator extends StatefulWidget {
  const AnimatedLinearProgressIndicator({super.key, required this.value, required this.color});

  final double value;
  final Color color;

  @override
  State<AnimatedLinearProgressIndicator> createState() => _AnimatedLinearProgressIndicatorState();
}

class _AnimatedLinearProgressIndicatorState extends State<AnimatedLinearProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _oldValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _updateAnimation(initial: true);
  }

  @override
  void didUpdateWidget(covariant AnimatedLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _oldValue = oldWidget.value;
      _updateAnimation();
    }
  }

  void _updateAnimation({bool initial = false}) {
    _animation = Tween<double>(
      begin: initial ? 0.0 : _oldValue,
      end: widget.value,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder:
          (context, _) => LinearProgressIndicator(value: _animation.value, color: widget.color, backgroundColor: widget.color.withValues(alpha: 0.2)),
    );
  }
}
