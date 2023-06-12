part of 'search_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class SearchFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final CodeVaucher codeVaucher;

  const SearchFormState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.codeVaucher = const CodeVaucher.pure()});

  SearchFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    CodeVaucher? codeVaucher,
  }) =>
      SearchFormState(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          codeVaucher: codeVaucher ?? this.codeVaucher);

  @override
  List<Object> get props => [formStatus, isValid, codeVaucher];
}
