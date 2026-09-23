import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../providers/favorite_provider.dart';
import '../screens/movie_details_screen.dart';
import 'rating_badge.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
  ..scaleByDouble(
    isHovered ? 1.02 : 1.0,
    isHovered ? 1.02 : 1.0,
    1.0,
    1.0,
  ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(
                  movie: widget.movie,
                ),
              ),
            );
          },
          child: Card(
            elevation: isHovered ? 8 : 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          widget.movie.posterUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        top: 8,
                        right: 8,
                        child: RatingBadge(
                          rating: widget.movie.rating,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.movie.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    10,
                    0,
                    6,
                    10,
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.movie.genre,
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
                              favoriteProvider.isFavorite(
                            widget.movie,
                          );

                          return IconButton(
                            onPressed: () {
                              favoriteProvider.toggleFavorite(
                                widget.movie,
                              );
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
        ),
      ),
    );
  }
}