import 'package:formz/formz.dart';

enum CodeVoucherError { empty, length }

class CodeVaucher extends FormzInput<String, CodeVoucherError> {
  const CodeVaucher.pure() : super.pure('');
  const CodeVaucher.dirty(String value) : super.dirty(value);
  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == CodeVoucherError.empty) return 'Please enter some code';
    if (displayError == CodeVoucherError.length) {
      return 'Code must be 10 characters';
    }
    return null;
  }

  @override
  CodeVoucherError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return CodeVoucherError.empty;
    if (value.length > 10) return CodeVoucherError.length;
    return null;
  }
}
