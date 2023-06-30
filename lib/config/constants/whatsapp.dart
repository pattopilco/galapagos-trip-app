import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Whatsapp {
  void open(
      {required BuildContext context,
      required String text,
      required String number}) async {
    var whatsapp = number; //+92xx enter like this
    final whatsappURlAndroid =
        "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";

    if (Platform.isIOS) {
      try {
        _launchUri(Uri.parse(whatsappURLIos));
      } catch (e) {
        const SnackBar(content: Text("Whatsapp not installed"));
      }
    } else {
      try {
        _launchUrl(whatsappURlAndroid);
      } catch (e) {
        const SnackBar(content: Text("Whatsapp not installed"));
      }
    }
  }

  Future<void> _launchUri(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchUrl(url) async {
    if (!await launch(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
