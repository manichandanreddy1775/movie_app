import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/models/movie.dart';
import 'package:movie_app/providers/favorite_provider.dart';

void main() {
  test('FavoriteProvider toggles favorites correctly', () {
    final provider = FavoriteProvider();

    final movie = Movie(
      id: 1,
      title: 'Inception',
      posterUrl: 'https://example.com/inception.jpg',
      description: 'A science fiction movie',
      rating: 8.8,
      genre: 'Sci-Fi',
      releaseDate: '2010',
    );

    expect(provider.isFavorite(movie), false);

    provider.toggleFavorite(movie);

    expect(provider.isFavorite(movie), true);
    expect(provider.favorites.length, 1);

    provider.toggleFavorite(movie);

    expect(provider.isFavorite(movie), false);
    expect(provider.favorites.length, 0);
  });
}