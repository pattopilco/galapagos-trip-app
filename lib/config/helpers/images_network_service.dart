import 'dart:io';
import 'package:flutter/material.dart';

class ImagesNetworkService {
  static Widget buildImage(path, name) {
    return Image.network(path + name, fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
      return Container(
        width: 350,
        height: 180,
        color: Colors.black12,
        alignment: Alignment.center,
        child: const Text(
          'Image Not available',
          style: TextStyle(fontSize: 30),
        ),
      );
    }, loadingBuilder: (context, child, progress) {
      return progress == null ? child : const LinearProgressIndicator();
    });
  }

  static Widget buildImageLocalStorage(path) {
    return Image.file(
      File(path),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: 360,
          height: 180,
          color: Colors.black12,
          alignment: Alignment.center,
          child: const Text(
            'Image Not available',
            style: TextStyle(fontSize: 30),
          ),
        );
      },
    );
  }

  static Widget buildLogoLocalStorage(path) {
    return Image.file(
      File(path),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.black12,
          alignment: Alignment.center,
          child: const Text(
            'Image Not available',
            style: TextStyle(fontSize: 12),
          ),
        );
      },
    );
  }

  static List<Widget> buildImagesLabel(
      String pathLocalStorage, List<dynamic> images) {
    List<Widget> widgetList = [];
    if (images.isNotEmpty) {
      images.asMap().forEach((index, element) {
        widgetList.add(buildImageCard(
            pathLocalStorage + element.image, element.description));
      });
    } else
      widgetList.add(Container());
    return widgetList;
  }

  static Widget buildImageCard(image, label) => Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              File(image),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            child: Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  wordSpacing: 10,
                  color: Color(0xff293643),
                  fontSize: 24),
            ),
          ),
          //)
        ],
      );
}
