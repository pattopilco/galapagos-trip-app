import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/presentation/widgets/commons/generic_app_bar.dart';

class GenericContainer extends StatelessWidget {
  final Widget body;
  const GenericContainer({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: <Widget>[
            const GenericAppBar(),
            SliverToBoxAdapter(
              child: body,
            )
          ],
        ),
      ),
    );
  }
}
