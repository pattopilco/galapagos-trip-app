import 'package:flutter_bloc/flutter_bloc.dart';

part 'voucher_cubit_state.dart';

class VoucherCubit extends Cubit<VoucherState> {
  VoucherCubit() : super(VoucherState(voucher: ''));

  void changeVoucher(String value) {
    emit(state.copyWith(
        voucher: value, transactionVoucher: state.transactionVoucher + 1));
  }

  void reset() {
    emit(state.copyWith(voucher: ''));
  }
}
