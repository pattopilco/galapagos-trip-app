import 'package:flutter/material.dart';

import 'util_file_services.dart';

class ImagesNetworkService {
  static Widget buildImage(path, name) {
    return Image.network(path + name, fit: BoxFit.cover,
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
    }, loadingBuilder: (context, child, progress) {
      return progress == null ? child : const LinearProgressIndicator();
    });
  }

  static List<Widget> buildImagesLabel(List<dynamic> images) {
    List<Widget> widgetList = [];
    if (images.isNotEmpty) {
      images.asMap().forEach((index, element) {
        widgetList.add(buildImageCard(element.image, element.description));
      });
      //Future.forEach(images, (image) async {
      //  Widget widget =
      //      await buildImageCard(image['image'], image['description']);
      //  widgetList.add(widget);
      //  print(image['image']);
      //});
    } else
      widgetList.add(Container());
    return widgetList;
  }

  static Widget buildImageCard(image, label) => Card(
        child: Stack(
          children: [
            Ink.image(
              image:
                  NetworkImage('${UtilFileService.url_upload_cruises}$image'),
              fit: BoxFit.cover,
            ),
            //Ink.image(
            //  image: FileImage(await UtilFile.getImageLocalStorage(image)),
            //  child: InkWell(onTap: () {}),
            //  fit: BoxFit.cover,
            //),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    wordSpacing: 5,
                    color: Colors.white,
                    backgroundColor: Colors.brown.withOpacity(0.5),
                    fontSize: 24),
              ),
            )
          ],
        ),
      );
}
