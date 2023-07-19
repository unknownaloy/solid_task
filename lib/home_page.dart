import 'package:flutter/material.dart';
import 'package:solid_task/utils.dart';

/// Home page and first screen of the app
class HomePage extends StatelessWidget {
  /// class constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Solid App",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ColoredBox(
        color: Utils.generateRandomColor(),
        child: const Center(
          child: Text(
            "Hello there",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
