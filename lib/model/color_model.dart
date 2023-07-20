import 'package:flutter/material.dart';
import 'package:solid_task/utils.dart';

/// Data-class for modelling the background and contrasting colors
class ColorModel {
  /// background / container color
  final Color backgroundColor;

  /// Text color contrasting the background color
  final Color contrastingColor;

  /// class constructor
  const ColorModel({
    required this.backgroundColor,
    required this.contrastingColor,
  });

  /// from JSON implementation
  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      backgroundColor: Utils.intToColor(json['backgroundColor'] as int),
      contrastingColor: Utils.intToColor(json['contrastingColor'] as int),
    );
  }

  /// to JSON implementation
  Map<String, dynamic> toJson() {
    return {
      'backgroundColor': backgroundColor.value,
      'contrastingColor': contrastingColor.value,
    };
  }
}
