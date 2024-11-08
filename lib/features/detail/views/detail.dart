import 'package:flutter/material.dart';
import 'package:movie_stream/core/data/model/movie.dart';
import 'package:movie_stream/core/data/repository/movie_repository.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  final MovieRepository movieRepository;

  const DetailScreen(
      {super.key, required this.movie, required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Image
                Image.network(movie.banner,
                    width: double.infinity, height: 250, fit: BoxFit.cover),

                // Poster, Title, Year, Duration, and Director
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(movie.poster,
                          width: 100, height: 150, fit: BoxFit.cover),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "(${movie.year})",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width:
                                          80,
                                      child: Text(
                                        "Genre",
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ),
                                    Text(": ${movie.genre}",
                                        style: const TextStyle(
                                            color: Colors.white70)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 80,
                                      child: Text(
                                        "Duration",
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ),
                                    Text(": ${movie.duration}",
                                        style: const TextStyle(
                                            color: Colors.white70)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 80,
                                      child: Text(
                                        "Director",
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ),
                                    Text(": ${movie.director}",
                                        style: const TextStyle(
                                            color: Colors.white70)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 80,
                                      child: Text(
                                        "Rating",
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ),
                                    Text(": ${movie.ageRating}",
                                        style: const TextStyle(
                                            color: Colors.white70)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      // Add to Favorites Button
                      Expanded(
                        child: _FavoriteButton(
                          movie: movie,
                          movieRepository: movieRepository,
                        ),
                      ),
                    ],
                  ),
                ),

                // Description
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Description:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    movie.description,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
                // Cast List
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Cast:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie.cast
                        .map((actor) => Text(actor,
                            style: const TextStyle(color: Colors.white70)))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          // Custom Back Button
          Positioned(
            top: 20, // Adjust as needed
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5), // Black with transparency
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatefulWidget {
  final Movie movie;
  final MovieRepository movieRepository;

  const _FavoriteButton({required this.movie, required this.movieRepository});

  @override
  __FavoriteButtonState createState() => __FavoriteButtonState();
}

class __FavoriteButtonState extends State<_FavoriteButton> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.movie.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (_isFavorite) {
              widget.movieRepository.removeFavorite(widget.movie);
            } else {
              widget.movieRepository.addFavorite(widget.movie);
            }
            _isFavorite = !_isFavorite;
          });
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: _isFavorite ? Colors.red : Colors.red),
          backgroundColor: _isFavorite ? Colors.red : Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(
          _isFavorite ? 'Added to Favorites' : 'Add to Favorites',
          style: TextStyle(
            color: _isFavorite ? Colors.black : Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
