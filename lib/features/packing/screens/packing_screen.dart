import 'package:flutter/material.dart';

import '../../commons/menu/widgets/generic_container_menu.dart';
import '../../galapagos/widgets/content_card.dart';

class PackingScreen extends StatelessWidget {
  const PackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenericContainerMenu(
      body: ContentCard(
        title: '',
        titleLabel: '',
        description:
            'Be prepared! Below is a list of recommended clothing gear and other items to be sure to bring so you’re ready for anything. ',
        image: "assets/images/before/what-to-pack.png",
        link: '',
      ),
    );
  }
}
