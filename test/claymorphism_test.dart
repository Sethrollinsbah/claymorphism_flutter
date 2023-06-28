import 'dart:ui';

import 'package:claymorphism/src/clay_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('ClayCard renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ClayCard(
            height: 200,
            width: 200,
          ),
        ),
      ),
    );

    expect(find.byType(ClayCard), findsOneWidget);
  });

testWidgets('BazaarMainPainter paints correctly', (WidgetTester tester) async {
  final painter = BazaarMainPainter([]);

  final pictureRecorder = PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  const size = Size(200, 200);

  painter.paint(canvas, size);

  final picture = pictureRecorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  // Example expectations:
  expect(byteData, isNotNull); // Verifying that the image byte data is not null
  expect(painter.shadColor, isEmpty); // Verifying that the shadColor property is empty
  // Add more specific expectations based on the behavior you want to test
});
}
