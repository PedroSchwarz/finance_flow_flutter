import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.label,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters = const [],
    this.fillColor,
    this.border,
    this.hint,
    this.helper,
    this.textStyle,
    this.labelStyle,
    this.floatingLabelBehavior,
    this.initialValue,
    this.currencyValue,
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
  final List<TextInputFormatter> inputFormatters;
  final Color? fillColor;
  final InputBorder? border;
  final String? hint;
  final String? helper;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? initialValue;
  final double? currencyValue;
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
    if (widget.currencyValue != null) {
      final NumberFormat formatter = NumberFormat.simpleCurrency(locale: Intl.getCurrentLocale());
      _controller = TextEditingController(text: formatter.format(widget.currencyValue));
      return;
    }

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
    final theme = Theme.of(context);

    return TextFormField(
      controller: _controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      maxLines: widget.maxLines,
      style: widget.textStyle ?? const TextStyle(),
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        enabledBorder: widget.border,
        focusedBorder: widget.border,
        focusedErrorBorder: widget.border?.copyWith(borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
        errorBorder: widget.border?.copyWith(borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
        floatingLabelBehavior: widget.floatingLabelBehavior,
        labelStyle: widget.labelStyle ?? const TextStyle(),
        label: Text(widget.label, style: TextStyle(color: widget.error != null ? theme.colorScheme.error : null)),
        helperText: widget.helper,
        helperStyle: theme.textTheme.bodyLarge,
        hintText: widget.hint,
        error: widget.error != null ? Text(widget.error!, style: TextStyle(color: theme.colorScheme.error)) : null,
        suffixIcon: widget.suffixIcon,
      ),
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

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter();

  final NumberFormat _formatter = NumberFormat.simpleCurrency(locale: Intl.systemLocale);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return TextEditingValue(text: _formatter.format(0), selection: TextSelection.collapsed(offset: _formatter.format(0).length));
    }

    String paddedDigits = digitsOnly.padLeft(3, '0');
    String dollarsStr = paddedDigits.substring(0, paddedDigits.length - 2);
    String centsStr = paddedDigits.substring(paddedDigits.length - 2);

    dollarsStr = dollarsStr.replaceFirst(RegExp(r'^0+'), '');
    if (dollarsStr.isEmpty) dollarsStr = '0';

    final number = double.parse('$dollarsStr.$centsStr');
    final formatted = _formatter.format(number);

    return TextEditingValue(text: formatted, selection: TextSelection.collapsed(offset: formatted.length));
  }

  static double parseFormatted(String text) {
    final formatter = NumberFormat.simpleCurrency(locale: Intl.systemLocale);

    final decimalSeparator = formatter.symbols.DECIMAL_SEP;
    final cleaned =
        text.replaceAll(formatter.currencySymbol, '').replaceAll(formatter.symbols.GROUP_SEP, '').replaceAll(decimalSeparator, '.').trim();

    return double.tryParse(cleaned) ?? 0.0;
  }

  static String getFormatted(double amount) {
    final formatter = NumberFormat.simpleCurrency(locale: Intl.systemLocale);

    return formatter.format(amount);
  }
}
