import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/launcher/logo_galapagos.png',
          fit: BoxFit.contain,
          height: 50,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PhotoView(
          imageProvider: AssetImage(image),
        ),
      ),
    );
  }
}
