import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
  onTap: () {
   Navigator.pushNamed(
  context,
  '/details',
  arguments: movie,
);
  },
  child: Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    movie.posterUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.movie,
                          size: 50,
                        ),
                      );
                    },
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(movie.genre),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${movie.title} added to favorites',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
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