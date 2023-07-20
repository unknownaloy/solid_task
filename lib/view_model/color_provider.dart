import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solid_task/color_model.dart';
import 'package:solid_task/utils.dart';

/// ChangeNotifier class responsible for maintaining the colors to be displayed
/// to the user
class ColorProvider extends ChangeNotifier {
  Color? _backgroundColor;
  Color? _contrastingColor;

  /// Getter for [_backgroundColor]
  Color get backgroundColor => _backgroundColor ?? Colors.white;

  /// Getter for [_contrastingColor]
  Color get contrastingColor => _contrastingColor ?? Colors.black;

  /// This method is called when the widget is build to generate a random color
  /// to be displayed
  Future<void> initializeRandomColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final userPreference = prefs.getString("userPreference");

    /// User already had color generated from previous interaction with the app
    if (userPreference != null) {
      final decodedData = jsonDecode(userPreference) as Map<String, dynamic>;
      final colorModel = ColorModel.fromJson(decodedData);

      _backgroundColor = colorModel.backgroundColor;
      _contrastingColor = colorModel.contrastingColor;

      notifyListeners();

      return;
    }

    _backgroundColor = Utils.generateRandomColor();
    _contrastingColor = Utils.getContrastingColor(_backgroundColor);

    notifyListeners();
  }



  /// Method to generate new random background and contrasting color and also
  /// saving the new selection in SharedPreferences
  Future<void> generateRandomColor() async {
    _backgroundColor = Utils.generateRandomColor();
    _contrastingColor = Utils.getContrastingColor(_backgroundColor);

    notifyListeners();

    final colorModel = ColorModel(
      backgroundColor: backgroundColor,
      contrastingColor: contrastingColor,
    );

    final colorData = jsonEncode(colorModel.toJson());

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      "userPreference",
      colorData,
    );
  }
}
