/// Data-class for modelling the background and contrasting colors
class ColorModel {
  /// background / container color
  final String backgroundColor;

  /// Text color contrasting the background color
  final String contrastingColor;

  /// class constructor
  const ColorModel({
    required this.backgroundColor,
    required this.contrastingColor,
  });

  /// from JSON implementation
  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      backgroundColor: json['backgroundColor'] as String,
      contrastingColor: json['contrastingColor'] as String,
    );
  }

  /// to JSON implementation
  Map<String, dynamic> toJson() {
    return {
      'backgroundColor': backgroundColor,
      'contrastingColor': contrastingColor,
    };
  }
}
