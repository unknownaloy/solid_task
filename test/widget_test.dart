import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:solid_task/view_model/color_provider.dart';
import 'package:solid_task/widgets/my_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ColorProvider>(
            create: (_) => ColorProvider(),
          ),
        ],
        child: Builder(
          builder: (_) => const MyApp(),
        ),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.byKey(const Key("main_text")), findsOneWidget);
  });
}
