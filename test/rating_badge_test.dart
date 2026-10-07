import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/widgets/rating_badge.dart';

void main() {
  testWidgets(
    'RatingBadge displays the movie rating',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RatingBadge(rating: 8.8),
          ),
        ),
      );

      expect(find.text('8.8'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    },
  );
}