import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  static double wp(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent / 100;
  }

  static double hp(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * percent / 100;
  }

  static double ip(BuildContext context, double percent) {
    final size = MediaQuery.of(context).size;

    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    return inch * percent / 100;
  }
}
