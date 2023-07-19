import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/commons/menu/widgets/generic_app_bar.dart';

class GenericContainer extends StatelessWidget {
  final Widget body;
  const GenericContainer({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    //bool blockScroll = false;
    //ScrollController controller = ScrollController();
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          //controller: controller,
          //physics:
          //    blockScroll ? NeverScrollableScrollPhysics() : ScrollPhysics(),
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
