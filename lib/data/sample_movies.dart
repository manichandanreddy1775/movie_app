import '../models/movie.dart';

final List<Movie> sampleMovies = [
  Movie(
    id: 1,
    title: 'Inception',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg',
    description:
        'A skilled thief who steals secrets through dreams is given a chance to erase his past.',
    rating: 8.8,
    genre: 'Sci-Fi',
    releaseDate: '2010',
  ),
  Movie(
    id: 2,
    title: 'Interstellar',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    description:
        'A group of explorers travel through a wormhole in space to ensure humanity has a future.',
    rating: 8.7,
    genre: 'Sci-Fi',
    releaseDate: '2014',
  ),
  Movie(
    id: 3,
    title: 'The Dark Knight',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
    description:
        'Batman faces a criminal mastermind who creates chaos across Gotham City.',
    rating: 9.0,
    genre: 'Action',
    releaseDate: '2008',
  ),
  Movie(
    id: 4,
    title: 'Avengers: Endgame',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
    description:
        'The Avengers unite for one final battle to restore what was lost.',
    rating: 8.3,
    genre: 'Action',
    releaseDate: '2019',
  ),
];