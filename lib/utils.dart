import 'dart:math';

import 'package:flutter/material.dart';

/// This class contains utility methods for specific tasks
class Utils {
  /// This method generates an random opaque color
  static Color generateRandomColor() {
    final Random random = Random();

    const alphaValue = 255;

    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);

    return Color.fromARGB(
      alphaValue,
      red,
      green,
      blue,
    );
  }

  /// This method analysis and returns a contrasting or opposite color to the
  /// color passed in as a parameter
  static Color getContrastingColor(Color? color) {
    const luminancePoint = 0.5;

    if (color != null) {
      return color.computeLuminance() > luminancePoint
          ? Colors.black
          : Colors.white;
    }

    return Colors.grey;
  }

  /// This method converts a int color value to a usable Color value
  static Color intToColor(int color) {
    return Color(color);
  }
}
