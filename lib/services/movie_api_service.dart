import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie.dart';

class MovieApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((item) {
        final int id = item['id'];

        return Movie(
          id: id,
          title: item['title'],
          posterUrl:
              'https://picsum.photos/seed/movie$id/500/750',
          description: item['body'],
          rating: 8.0,
          genre: 'Drama',
          releaseDate: '2026',
        );
      }).toList();
    } else {
      throw Exception(
        'Failed to load movies. Status code: ${response.statusCode}',
      );
    }
  }
}