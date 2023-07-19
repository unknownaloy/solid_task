import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_task/view_model/color_provider.dart';

/// Home page and first screen of the app
class HomePage extends StatelessWidget {
  /// class constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (_, model, __) => Scaffold(
        body: GestureDetector(
          onTap: () => model.generateRandomColor(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            color: model.backgroundColor ?? Colors.white,
            child: Center(
              child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: model.contrastingColor ?? Colors.black,
                ),
                duration: const Duration(milliseconds: 200),
                child: const Text("Hello there"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
