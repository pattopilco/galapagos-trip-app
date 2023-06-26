import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:galapagos_trip_app/features/trip/presentation/providers/booking_provider.dart';
import 'package:galapagos_trip_app/infraestructure/inputs/codevoucher.dart';

//3. Provider
final tripFormProvider =
    StateNotifierProvider.autoDispose<TripFormNotifier, TripFormState>((ref) {
  final bookingCallback = ref.watch(bookingProvider.notifier).findBooking;
  return TripFormNotifier(bookingCallback: bookingCallback);
});

// 1. Estado
class TripFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final CodeVaucher codeVaucher;

  TripFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.codeVaucher = const CodeVaucher.pure()});

  TripFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    CodeVaucher? codeVaucher,
  }) =>
      TripFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        codeVaucher: codeVaucher ?? this.codeVaucher,
      );

  @override
  String toString() {
    return '''
    TripFormState: 
    isPosting : $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    codeVaucher: $codeVaucher
    ''';
  }
}

//2. Notifier

class TripFormNotifier extends StateNotifier<TripFormState> {
  final Function(String) bookingCallback;
  TripFormNotifier({required this.bookingCallback}) : super(TripFormState());

  void codeVoucherChanged(String value) {
    final newCodeVoucher = CodeVaucher.dirty(value);
    state = state.copyWith(
        codeVaucher: newCodeVoucher, isValid: Formz.validate([newCodeVoucher]));
  }

  void onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    await bookingCallback(state.codeVaucher.value);
  }

  _touchEveryField() {
    final codeVoucher = CodeVaucher.dirty(state.codeVaucher.value);
    state = state.copyWith(
        isFormPosted: true,
        codeVaucher: codeVoucher,
        isValid: Formz.validate([
          codeVoucher,
        ]));
  }
}
