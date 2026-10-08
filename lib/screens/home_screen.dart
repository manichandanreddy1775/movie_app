import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../providers/favorite_provider.dart';
import '../services/movie_api_service.dart';
import '../widgets/fade_in_animation.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_search_form.dart';
import '../widgets/movie_state_message.dart';
import '../widgets/section_title.dart';
import '../widgets/slide_in_animation.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieApiService _apiService = MovieApiService();

  late Future<List<Movie>> _moviesFuture;

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _moviesFuture = _apiService.fetchMovies();
  }

  Future<void> _refreshMovies() async {
    setState(() {
      _moviesFuture = _apiService.fetchMovies();
    });

    await _moviesFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh movies',
            onPressed: _refreshMovies,
          ),
          Consumer<FavoriteProvider>(
            builder: (context, favoriteProvider, child) {
              final count = favoriteProvider.favorites.length;

              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritesScreen(),
                        ),
                      );
                    },
                  ),
                  if (count > 0)
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount;

          if (constraints.maxWidth < 600) {
            crossAxisCount = 2;
          } else if (constraints.maxWidth < 900) {
            crossAxisCount = 3;
          } else {
            crossAxisCount = 4;
          }

          return RefreshIndicator(
            onRefresh: _refreshMovies,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to Movie App',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Discover movies you will love',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  MovieSearchForm(
                    onSearch: (query) {
                      setState(() {
                        _searchQuery = query.toLowerCase();
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  const SectionTitle(
                    title: 'Movies from REST API',
                  ),
                  const SizedBox(height: 12),
                  FutureBuilder<List<Movie>>(
                    future: _moviesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (snapshot.hasError) {
                        return const MovieStateMessage(
                          icon: Icons.error_outline,
                          message:
                              'Failed to load movies. Please try again.',
                        );
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const MovieStateMessage(
                          icon: Icons.movie_outlined,
                          message: 'No movies found.',
                        );
                      }

                      final movies = snapshot.data!;

                      final filteredMovies = movies.where((movie) {
                        return movie.title
                            .toLowerCase()
                            .contains(_searchQuery);
                      }).toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${filteredMovies.length} movies found',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (filteredMovies.isEmpty)
                            const MovieStateMessage(
                              icon: Icons.search_off,
                              message:
                                  'No movies match your search.',
                            )
                          else
                            GridView.builder(
                              shrinkWrap: true,
                              physics:
                                  const NeverScrollableScrollPhysics(),
                              itemCount: filteredMovies.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.65,
                              ),
                              itemBuilder: (context, index) {
                                return FadeInAnimation(
                                  child: SlideInAnimation(
                                    child: MovieCard(
                                      movie: filteredMovies[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}