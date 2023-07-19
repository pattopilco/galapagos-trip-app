import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade900)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        focusColor: colors.primary,
      ),
    );
  }
}
