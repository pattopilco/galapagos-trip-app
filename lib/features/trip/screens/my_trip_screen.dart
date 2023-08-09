import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/trip/presentation/providers/booking_provider.dart';
import 'package:galapagos_trip_app/features/trip/presentation/providers/providers.dart';
import 'package:galapagos_trip_app/features/trip/widgets/text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../commons/menu/widgets/generic_container_menu.dart';
import '../widgets/custom_List_item.dart';
import '../widgets/search_widget_change_notifier.dart';

class MyTripScreen extends StatelessWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GenericContainerMenu(
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Card(
                    elevation: 8,
                    child: Container(
                      padding: const EdgeInsets.all(32.0),
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: const SingleChildScrollView(
                        child: _TripForm(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TripForm extends ConsumerWidget {
  const _TripForm();

  void showSnackbar(BuildContext context, String message) {
    message = message.replaceAll("Exception:", ""); // myString is "s t r"
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      padding: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripFormNoti = ref.read(tripFormProvider.notifier);
    final searchForm = ref.watch(tripFormProvider);
    final bookingProv = ref.watch(bookingProvider);
    final bookingNoti = ref.read(bookingProvider.notifier);
    bookingNoti.existVoucher(bookingProv.bookingStatus);
    bool isVisible = bookingProv.bookingStatus == BookingStatus.authenticated;
    ref.listen(bookingProvider, (previus, next) {
      if (next.errorMessage.isEmpty) return;
      if (next.bookingStatus == BookingStatus.notAuthenticated) {
        showSnackbar(context, next.errorMessage);
      }
    });
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _gap(),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "Voucher Code",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          _gap(),
          Visibility(
            visible: !isVisible,
            child: Column(
              children: [
                CustomTextFormField(
                  onChanged: (value) => ref
                      .read(tripFormProvider.notifier)
                      .codeVoucherChanged(value),
                  errorMessage: searchForm.codeVaucher.errorMessage,
                ),
                _gap(),
                SizedBox(
                  width: double.infinity,
                  child: SearchWidgetChangeNotifier(
                    bookingProv: bookingProv,
                    tripFormNoti: tripFormNoti,
                  ),
                ),
              ],
            ),
          ),
          _gap(),
          Visibility(
              visible: isVisible,
              child: CustomListItem(
                dateSearch: bookingProv.dateSearch.toString(),
                pathLocalStorage: bookingProv.pathLocalStorage,
                code: bookingProv.codeBoatDecode,
                cruise: bookingProv.nameBoat,
              )),
        ],
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
