import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class Responsive {
  late double width;
  late double height;
  late double inch;

  Responsive(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    inch = math.sqrt(math.pow(width, 2) + math.pow(height, 2));
  }

  double widthp(double percent) {
    return width * percent / 100;
  }

  double heightp(double percent) {
    return height * percent / 100;
  }

  double inchp(double percent) {
    return inch * percent / 100;
  }
}
