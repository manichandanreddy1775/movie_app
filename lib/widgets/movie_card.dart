import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../providers/favorite_provider.dart';
import '../screens/movie_details_screen.dart';
import 'rating_badge.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              movie: movie,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster and Rating
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      movie.posterUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Reusable Rating Badge
                  Positioned(
                    top: 8,
                    right: 8,
                    child: RatingBadge(
                      rating: movie.rating,
                    ),
                  ),
                ],
              ),
            ),

            // Movie Title
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Genre and Favorite Button
            Padding(
              padding: const EdgeInsets.fromLTRB(
                10,
                0,
                6,
                10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.genre,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),

                  Consumer<FavoriteProvider>(
                    builder: (
                      context,
                      favoriteProvider,
                      child,
                    ) {
                      final isFavorite =
                          favoriteProvider.isFavorite(movie);

                      return IconButton(
                        onPressed: () {
                          favoriteProvider.toggleFavorite(movie);
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorite
                              ? Colors.red
                              : null,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}