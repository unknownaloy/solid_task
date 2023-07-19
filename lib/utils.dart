import 'dart:math';

import 'package:flutter/material.dart';

/// This class contains utility methods for specific tasks
class Utils {
  /// This method generates an random opaque color
  static Color generateRandomColor() {
    final Random random = Random();

    const fullyOpaqueValue = 255;

    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);

    return Color.fromARGB(
      fullyOpaqueValue,
      red,
      green,
      blue,
    ); // Alpha value of 255 (fully opaque)
  }

  /// This method analysis and returns a contrasting or opposite color to the
  /// color passed in as a parameter
  static Color? getContrastingColorFromInt(int? color) {
    final colorFromInt = _intToColor(color);

    const luminancePoint = 0.5;

    Color? generatedColor;

    if (colorFromInt != null) {
      generatedColor = colorFromInt.computeLuminance() > luminancePoint
          ? Colors.black
          : Colors.white;
    }

    return generatedColor;
  }


  // Testing theory
  static Color getContrastingColorFromInt2(Color? color) {
    const luminancePoint = 0.5;

    if (color != null) {
      return color.computeLuminance() > luminancePoint
          ? Colors.black
          : Colors.white;
    }

    return Colors.grey;
  }

  /// This method takes a 'Color' and returns its integer value
  // static int? colorToIntValueConverter(Color? color) {
  //   int? colorIntValue;
  //
  //   if (color != null) {
  //     final colorString = color.toString().split('0x').last.substring(0, 8);
  //
  //     const radixValue = 16;
  //
  //     colorIntValue = int.parse(colorString, radix: radixValue);
  //   }
  //
  //   return colorIntValue;
  // }

  static int? colorToIntValueConverter(Color? color) {
    return color?.value;
  }

  /// This method converts a int color value to a usable Color value
  static Color? _intToColor(int? color) {
    Color? colorFromInt;

    if (color != null) {
      colorFromInt = Color(color);
    }

    return colorFromInt;
  }
}
