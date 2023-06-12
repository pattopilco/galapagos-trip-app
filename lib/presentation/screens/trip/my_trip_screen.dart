import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/presentation/widgets/commons/generic_container.dart';
import 'package:galapagos_trip_app/presentation/widgets/inputs/text_form_field.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({Key? key}) : super(key: key);

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GenericContainer(
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Center(
                  child: Card(
                    elevation: 8,
                    child: Container(
                      padding: const EdgeInsets.all(32.0),
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: SingleChildScrollView(
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
                            _SearchForm(),
                          ],
                        ),
                      ),
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

  Widget _gap() => const SizedBox(height: 16);
}

class _SearchForm extends StatefulWidget {
  @override
  State<_SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<_SearchForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String voucherCode = '';

  //const SearchForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (value) => voucherCode = value,
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Please enter some code';
              if (value.trim().isEmpty) return 'Please enter some code';
              if (value.length > 10)
                return 'Please enter some code less than 10 characteres';
              return null;
            },
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
                if (_formKey.currentState?.validate() ?? false) {
                  print('$voucherCode');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
