import 'package:provider/provider.dart';
import 'providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/movie_details_screen.dart';
import 'models/movie.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoriteProvider(),
      child: const MovieApp(),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/details': (context) {
          final movie = ModalRoute.of(context)!.settings.arguments as Movie;

          return MovieDetailsScreen(movie: movie);
        },
      },
    );
  }
}