import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchFormState> {
  SearchCubit() : super(const SearchFormState());

  void onSubmit() {
    print('Submit: $state');
  }

  void voucherCode(String value) {
    emit(state.copyWith(voucherCode: value));
  }
}
