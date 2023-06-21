part of 'search_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class SearchFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final CodeVaucher codeVaucher;
  final String errorMessage;

  const SearchFormState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.codeVaucher = const CodeVaucher.pure(),
      this.errorMessage = ''});

  SearchFormState copyWith(
          {FormStatus? formStatus,
          bool? isValid,
          CodeVaucher? codeVaucher,
          String? errorMessage}) =>
      SearchFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        codeVaucher: codeVaucher ?? this.codeVaucher,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [formStatus, isValid, codeVaucher];
}
