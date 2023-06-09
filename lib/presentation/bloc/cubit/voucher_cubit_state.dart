part of 'voucher_cubit_cubit.dart';

class VoucherState {
  final String voucher;
  final int transactionVoucher;

  VoucherState({this.voucher = '', this.transactionVoucher = 0});

  copyWith({String? voucher, int? transactionVoucher}) => VoucherState(
        voucher: voucher ?? this.voucher,
        transactionVoucher: transactionVoucher ?? this.transactionVoucher,
      );
}
