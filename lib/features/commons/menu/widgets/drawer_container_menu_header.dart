import 'package:flutter/material.dart';

import '../../../../config/helpers/responsive.dart';

class DrawerHeaderRoyal extends StatefulWidget {
  final String appName;
  final String title;

  const DrawerHeaderRoyal(
      {Key? key, required this.appName, required this.title})
      : super(key: key);

  @override
  _DrawerHeaderRoyalState createState() => _DrawerHeaderRoyalState();
}

class _DrawerHeaderRoyalState extends State<DrawerHeaderRoyal> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Container(
                width: Responsive(context).widthp(60) * .24,
                height: Responsive(context).heightp(60) * .12,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/launcher/logo_galapagos.png',
                  width: 145,
                  height: 145,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children: <Widget>[
                Text(
                  widget.appName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(widget.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}
