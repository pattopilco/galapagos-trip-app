import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:galapagos_trip_app/features/trip/domain/domaint.dart';
import 'package:galapagos_trip_app/features/trip/infraestructure/infraestructura.dart';
import 'package:galapagos_trip_app/infraestructure/inputs/codevoucher.dart';

import 'package:dio/dio.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchFormState> {
  final TripRepository repository;

  SearchCubit({required this.repository}) : super(const SearchFormState());

  void onSubmit() async {
    _touchEveryField();
    print('Submit: $state');
    //getVoucherInf();
    //print('Submit: $state');
  }

  void codeVoucherChanged(String value) {
    final codeVoucher = CodeVaucher.dirty(value);
    emit(state.copyWith(
        codeVaucher: codeVoucher, isValid: Formz.validate([codeVoucher])));
  }

  _touchEveryField() {
    final codeVoucher = CodeVaucher.dirty(state.codeVaucher.value);

    emit(state.copyWith(
        formStatus: FormStatus.validating,
        codeVaucher: codeVoucher,
        isValid: Formz.validate([
          codeVoucher,
        ])));
  }

/*
  Future<void> logout(String? errorMessage) async {
    final codeVoucher = CodeVaucher.dirty(state.codeVaucher.value);
    emit(state.copyWith(
      formStatus: FormStatus.invalid,
      codeVaucher: codeVoucher,
      errorMessage: errorMessage,
    ));
  }

  Future<String> _getTokenAuth() async {
    String tokenStr = '';
    try {
      Token token = await repository.findToken();
      tokenStr = token.token;
    } on DioException catch (de) {
      if (de.response?.statusCode == 401) throw WrongCredentials();
      if (de.response?.statusCode == 500) {
        throw Exception('Internal Server Error');
      }
      if (de.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeout();
      }
    } catch (e) {
      throw Exception('Error GetTokenAuth');
    }
    return tokenStr;
  }

  void getVoucherInf() async {
    String _token;
    try {
      _token = await _getTokenAuth();
      print(_token);
    } on WrongCredentials {
      logout('Incorrect Credentials');
    } on ConnectionTimeout {
      logout('Timeout');
    } catch (e) {
      logout('Error');
    }
  }

  void _setTokenAuth(Token token) {
    //TODO: guardar toquen en dispositivo fisicamente

    final codeVoucher = CodeVaucher.dirty(state.codeVaucher.value);
    emit(state.copyWith(
      formStatus: FormStatus.valid,
      codeVaucher: codeVoucher,
    ));
  }

  */
}
