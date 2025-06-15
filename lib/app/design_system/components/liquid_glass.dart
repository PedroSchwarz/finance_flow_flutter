import 'dart:ui';

import 'package:finance_flow/app/app.dart';
import 'package:flutter/material.dart';

class LiquidGlassCard extends StatelessWidget {
  const LiquidGlassCard({required this.child, this.padding, this.margin, this.borderRadius, super.key});

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.s),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 30, offset: const Offset(0, 15)),
          BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, -5)),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.s),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1.5),
              borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.s),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white.withValues(alpha: 0.1), Colors.white.withValues(alpha: 0.0)],
                      ),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppSpacing.s), topRight: Radius.circular(AppSpacing.s)),
                    ),
                  ),
                ),
                Padding(padding: padding ?? EdgeInsets.zero, child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LiquidGlassButton extends StatefulWidget {
  const LiquidGlassButton({super.key, required this.text, required this.onTap, this.isSecondary = false});

  final String text;
  final VoidCallback onTap;
  final bool isSecondary;

  @override
  State<LiquidGlassButton> createState() => _LiquidGlassButtonState();
}

class _LiquidGlassButtonState extends State<LiquidGlassButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: AppSpacing.xs),
          decoration: BoxDecoration(
            gradient:
                widget.isSecondary
                    ? LinearGradient(colors: [Colors.white.withValues(alpha: 0.2), Colors.white.withValues(alpha: 0.1)])
                    : LinearGradient(colors: [Colors.white.withValues(alpha: 0.4), Colors.white.withValues(alpha: 0.2)]),
            borderRadius: BorderRadius.circular(AppSpacing.s),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
          ),
          child: Text(widget.text, style: TextStyle(color: Colors.white.withValues(alpha: 0.95), fontSize: 14, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
