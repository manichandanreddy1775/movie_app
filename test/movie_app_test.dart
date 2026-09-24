import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/providers/favorite_provider.dart';

void main() {
  testWidgets(
    'Movie App displays the app title',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
          child: const MovieApp(),
        ),
      );

      expect(find.text('Movie App'), findsOneWidget);
    },
  );
}