import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/trip/presentation/providers/booking_provider.dart';
import 'package:galapagos_trip_app/features/trip/presentation/providers/providers.dart';
import 'package:galapagos_trip_app/presentation/widgets/inputs/text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../presentation/widgets/commons/generic_container.dart';
import '../../../presentation/widgets/shared/custom_List_item.dart';

class MyTripScreen extends StatelessWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericContainer(
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
                    constraints: const BoxConstraints(maxWidth: 350),
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
    );
  }
}

class _TripForm extends ConsumerWidget {
  const _TripForm();

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchForm = ref.watch(tripFormProvider);
    final bookingProv = ref.watch(bookingProvider);
    bool isVisible = bookingProv.bookingStatus == BookingStatus.authenticated;

    ref.listen(bookingProvider, (previus, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
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
          CustomTextFormField(
            onChanged: (value) =>
                ref.read(tripFormProvider.notifier).codeVoucherChanged(value),
            errorMessage: searchForm.codeVaucher.errorMessage,
          ),
          _gap(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                ref.read(tripFormProvider.notifier).onFormSubmit();
              },
            ),
          ),
          _gap(),
          Visibility(
              visible: isVisible,
              child: CustomListItem(
                code: bookingProv.codeBoatDecode,
                cruise: bookingProv.nameBoat,
              )),
        ],
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
