import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty || value.trim().isEmpty) {
          return 'Please enter some code';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your received code',
        errorText: 'Please enter some code',
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
