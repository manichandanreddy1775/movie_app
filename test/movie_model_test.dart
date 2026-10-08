import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/models/movie.dart';

void main() {
  test('Movie model stores movie details correctly', () {
    final movie = Movie(
      id: 1,
      title: 'Inception',
      posterUrl: 'https://example.com/inception.jpg',
      description: 'A science fiction movie',
      rating: 8.8,
      genre: 'Sci-Fi',
      releaseDate: '2010',
    );

    expect(movie.id, 1);
    expect(movie.title, 'Inception');
    expect(movie.rating, 8.8);
    expect(movie.genre, 'Sci-Fi');
    expect(movie.releaseDate, '2010');
  });
}