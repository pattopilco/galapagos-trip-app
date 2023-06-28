import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('View Image'),
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
