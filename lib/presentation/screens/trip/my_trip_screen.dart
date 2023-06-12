import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galapagos_trip_app/presentation/bloc/cubit/search/cubit/search_cubit.dart';
import 'package:galapagos_trip_app/presentation/widgets/commons/generic_container.dart';
import 'package:galapagos_trip_app/presentation/widgets/inputs/text_form_field.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({Key? key}) : super(key: key);

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  @override
  Widget build(BuildContext context) {
    return GenericContainer(
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: const _SearchView(),
      ),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}

class _SearchForm extends StatelessWidget {
  //const SearchForm({super.key});
  @override
  Widget build(BuildContext context) {
    final searchCubit = context.watch<SearchCubit>();
    final codeVaucher = searchCubit.state.codeVaucher;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: searchCubit.codeVoucherChanged,
            errorMessage: codeVaucher.errorMessage,
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
                searchCubit.onSubmit();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
