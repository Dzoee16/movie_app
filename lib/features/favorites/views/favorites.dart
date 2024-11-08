import 'package:flutter/material.dart';
import 'package:movie_stream/core/global_component/colors.dart';
import 'package:movie_stream/core/data/repository/movie_repository.dart';
import 'package:movie_stream/core/data/model/movie.dart';
import 'package:movie_stream/features/detail/views/detail.dart';

class FavoriteScreen extends StatefulWidget {
  final MovieRepository movieRepository;

  const FavoriteScreen({super.key, required this.movieRepository});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<Movie> favoriteMovies;

  @override
  void initState() {
    super.initState();
    _loadFavoriteMovies();
  }

  void _loadFavoriteMovies() {
    // Memuat film favorit dari repository
    setState(() {
      favoriteMovies = widget.movieRepository.fetchFavoriteMovies();
    });
  }

  void _toggleFavorite(Movie movie) {
    setState(() {
      if (movie.isFavorite) {
        widget.movieRepository.removeFavorite(movie);
      } else {
        widget.movieRepository.addFavorite(movie);
      }
      // Memuat ulang daftar favorit setelah perubahan
      _loadFavoriteMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainColor,
      body: favoriteMovies.isEmpty
          ? const Center(child: Text("No favorites added"))
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                final movie = favoriteMovies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          movie: movie,
                          movieRepository: widget.movieRepository,
                        ),
                      ),
                    );
                  },
                  child: _buildMovieCard(movie),
                );
              },
            ),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  movie.poster,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Display movie title and year
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "(${movie.year.toString()})",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // Add the 3-dot menu for favorite options
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    if (value == 'remove') {
                      _toggleFavorite(movie);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'remove',
                        height: 20,
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ];
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  color: Colors.black, // Set background color to black
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    side: const BorderSide(
                        color: Colors.white, width: 1), // White border
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
