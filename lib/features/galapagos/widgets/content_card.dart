import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const ContentCard(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: InteractiveViewer(
            boundaryMargin: EdgeInsets.zero,
            //transformationController: zoomTransformationController,
            maxScale: 3.0,
            minScale: 1,
            child: Image.asset(
              image,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
