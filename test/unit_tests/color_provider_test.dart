import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solid_task/constants.dart';
import 'package:solid_task/model/color_model.dart';
import 'package:solid_task/view_model/color_provider.dart';

void main() {
  const colorModel = ColorModel(
    backgroundColor: Colors.white,
    contrastingColor: Colors.black,
  );
  final colorData = jsonEncode(colorModel.toJson());

  final Map<String, Object> values = <String, Object>{
    kUserPreference: colorData,
  };

  SharedPreferences.setMockInitialValues(values);

  late ColorProvider sut;

  setUp(() {
    sut = ColorProvider();
  });

  test("Test that initial values are correct", () {
    expect(sut.backgroundColor, Colors.white);
    expect(sut.contrastingColor, Colors.black);
  });

  test("""
  initializeRandomColor,
     Testing that the select colors was successfully persisted using SharedPreferences,
     Testing that the backgroundColor is not null and has a Color
     Testing that the contrastingColor is not null and has a Color
     """, () async {
    await sut.initializeRandomColor();

    final pref = await SharedPreferences.getInstance();

    expect(pref.getString(kUserPreference), colorData);
    expect(sut.backgroundColor, isA<Color>());
    expect(sut.contrastingColor, isA<Color>());
  });

  test("""
  generateRandomColor,
     Testing that the select colors was successfully persisted using SharedPreferences,
     Testing that the backgroundColor is not null and has a Color
     Testing that the contrastingColor is not null and has a Color
     """, () async {
    await sut.generateRandomColor();

    final colorModel = ColorModel(
      backgroundColor: sut.backgroundColor,
      contrastingColor: sut.contrastingColor,
    );
    final colorData = jsonEncode(colorModel.toJson());

    final Map<String, Object> values = <String, Object>{
      kUserPreference: colorData,
    };

    SharedPreferences.setMockInitialValues(values);

    final pref = await SharedPreferences.getInstance();

    expect(pref.getString(kUserPreference), colorData);
    expect(sut.backgroundColor, isA<Color>());
    expect(sut.contrastingColor, isA<Color>());
  });
}
