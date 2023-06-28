import 'package:flutter/material.dart';

import '../../../presentation/widgets/commons/generic_container_menu.dart';

class BeforeScreen extends StatelessWidget {
  const BeforeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericContainerMenu(
      body: Container(
        color: const Color(0xff5e1f20).withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              //ModalBottomList(
              //  icono: Icons.search,
              //  listItem: destinationList,
              //  onTapFuntion: (value) {
              //    _onTapListMetodo(value);
              //  },
              //),
              //Column(
              //children: getCardList(),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
