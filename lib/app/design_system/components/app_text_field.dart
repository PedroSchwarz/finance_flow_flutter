import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.label,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.initialValue,
    this.error,
    this.maxLines = 1,
    this.obscureText,
    this.suffixIcon,
    super.key,
  });

  final String label;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final String? error;
  final int? maxLines;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue?.isEmpty ?? false) {
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      maxLines: widget.maxLines,
      decoration: InputDecoration(label: Text(widget.label), error: widget.error != null ? Text(widget.error!) : null, suffixIcon: widget.suffixIcon),
    );
  }
}

class TogglePasswordButton extends StatelessWidget {
  const TogglePasswordButton({required this.onPressed, required this.value, super.key});

  final VoidCallback onPressed;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(value ? Icons.visibility : Icons.visibility_off));
  }
}
