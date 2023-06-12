part of 'search_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class SearchFormState extends Equatable {
  final FormStatus formStatus;
  final String voucherCode;

  const SearchFormState(
      {this.formStatus = FormStatus.invalid, this.voucherCode = ''});

  SearchFormState copyWith({
    FormStatus? formStatus,
    String? voucherCode,
  }) =>
      SearchFormState(
          formStatus: formStatus ?? this.formStatus,
          voucherCode: voucherCode ?? this.voucherCode);

  @override
  List<Object> get props => [formStatus, voucherCode];
}
