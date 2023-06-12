import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../infraestructure/inputs/inputs.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchFormState> {
  SearchCubit() : super(const SearchFormState());

  void onSubmit() {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        codeVaucher: CodeVaucher.dirty(state.codeVaucher.value),
        isValid: Formz.validate([
          state.codeVaucher,
        ])));
    print('Submit: $state');
  }

  void codeVoucherChanged(String value) {
    final codeVoucher = CodeVaucher.dirty(value);
    emit(state.copyWith(
        codeVaucher: codeVoucher, isValid: Formz.validate([codeVoucher])));
  }
}
