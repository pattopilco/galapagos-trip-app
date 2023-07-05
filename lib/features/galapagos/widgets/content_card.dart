import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/features/galapagos/widgets/wrap_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';
//import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
//import 'package:pinch_zooming/pinch_zooming.dart';

import '../../../config/helpers/responsive.dart';
import '../screens/image_screen.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String? link;

  const ContentCard(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      this.link});

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 10.0,
      child: Column(
        children: <Widget>[
          Padding(
            // padding: EdgeInsets.all(Responsive(context).wp(100) * 0.05),
            padding: const EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                Visibility(
                  visible: title.isNotEmpty,
                  child: WrapWidget(
                    width: Responsive(context).widthp(100),
                    widget: Text(
                      title,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900,
                          fontSize: Responsive(context).inchp(12) * 0.2),
                    ),
                  ),
                ),
                Visibility(
                  visible: description.isNotEmpty,
                  child: WrapWidget(
                    width: Responsive(context).widthp(100),
                    widget: Column(
                      children: [
                        Text(
                          description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: Responsive(context).inchp(8) * 0.2),
                        ),
                        Visibility(
                          visible: _viewLink(link),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                                child: OutlinedButton(
                              onPressed: () async {
                                try {
                                  await launchUrlString(link ?? '');
                                } catch (err) {
                                  debugPrint('Something bad happened');
                                }
                              },
                              child: Text('More Info'),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Visibility(
                    visible: (image.isNotEmpty),
                    child: GestureDetector(
                      child: Image.asset(image),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ImageScreen(),
                            settings: RouteSettings(
                              arguments: image,
                            ),
                          ),
                        );
                      },
                      onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ImageScreen(),
                            settings: RouteSettings(
                              arguments: image,
                            ),
                          ),
                        );
                      },
                    )

                    /*
                  child: PinchZoomReleaseUnzoomWidget(
                    minScale: 0.8,
                    maxScale: 4,
                    resetDuration: const Duration(milliseconds: 200),
                    boundaryMargin: const EdgeInsets.only(bottom: 0),
                    clipBehavior: Clip.none,
                    useOverlay: true,
                    maxOverlayOpacity: 0.5,
                    overlayColor: Colors.black,
                    fingersRequiredToPinch: 2,
                    child: Image.asset(image),
                  ),
                  */
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(image) {
    //late TransformationController controller;
    return InteractiveViewer(
      //transformationController: controller,
      clipBehavior: Clip.none,
      panEnabled: false,
      minScale: 1,
      maxScale: 4,
      onInteractionEnd: (details) {
        //resetAnimation();
      },
      onInteractionStart: (details) {
        if (details.pointerCount < 2) return;
        //showOverlay(context);
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  bool _viewLink(link) {
    if (link == null) return false;
    if (link == '') return false;
    if (link == ' ') return false;
    return true;
  }
}
