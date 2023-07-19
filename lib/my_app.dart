import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_task/color_provider.dart';
import 'package:solid_task/home_page.dart';

/// Entry class
class MyApp extends StatelessWidget {
  /// class constructor
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorProvider>(
      create: (_) => ColorProvider()..generateRandomColor(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
