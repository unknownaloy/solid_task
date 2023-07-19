import 'package:flutter/material.dart';
import 'package:solid_task/utils.dart';

/// ChangeNotifier class responsible for maintaining the colors to be displayed
/// to the user
class ColorProvider extends ChangeNotifier {
  Color? _backgroundColor;
  Color? _contrastingColor;

  /// Getter for [_backgroundColor]
  Color? get backgroundColor => _backgroundColor;

  /// Getter for [_contrastingColor]
  Color? get contrastingColor => _contrastingColor;

  /// This method is called when the widget is build to generate a random color
  /// to be displayed
  void generateRandomColor() {
    // TODO: Retrieve last randomly generated color

    _backgroundColor = Utils.generateRandomColor();

    _contrastingColor = Utils.getContrastingColor(_backgroundColor);

    notifyListeners();
  }
}
