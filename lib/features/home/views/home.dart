import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_stream/core/global_component/colors.dart';
import 'package:movie_stream/core/data/model/movie.dart';
import 'package:movie_stream/core/data/repository/movie_repository.dart';
import 'package:movie_stream/features/detail/views/detail.dart';

class HomeScreen extends StatelessWidget {
  final movieRepository = MovieRepository();
  final ScrollController _scrollControllerTrending = ScrollController();
  final ScrollController _scrollControllerNewRelease = ScrollController();
  final ScrollController _scrollControllerSeries = ScrollController();

  HomeScreen({super.key});

  void _scrollLeft(ScrollController controller) {
    controller.animateTo(
      controller.offset - 200,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight(ScrollController controller) {
    controller.animateTo(
      controller.offset + 200,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final trendingMovies = movieRepository.getAllMovies().where((movie) {
      return [
        "John Wick: Chapter 4",
        "Inception",
        "The Fall Guy",
        "Top Gun: Maverick",
        "Terrifier 3"
      ].contains(movie.title);
    }).toList();

    final newReleases = movieRepository.getAllMovies().where((movie) {
      return [
        "Alien: Romulus",
        "Longlegs",
        "The Wild Robot",
        "Venom: Last Dance",
        "Transformers: One"
      ].contains(movie.title);
    }).toList();

    final series = movieRepository.getAllMovies().where((movie) {
      return [
        "Breaking Bad",
        "Game of Thrones",
        "Peaky Blinders",
        "The Penguin",
        "The Boys"
      ].contains(movie.title);
    }).toList();

    return Scaffold(
      backgroundColor: ColorConstants.mainColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBanner(context),
            _buildSection("Trending Now", trendingMovies, _scrollControllerTrending, context),
            _buildSection("New Release", newReleases, _scrollControllerNewRelease, context),
            _buildSection("Series", series, _scrollControllerSeries, context),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String title, List<Movie> movies, ScrollController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: ColorConstants.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white70),
                    onPressed: () => _scrollLeft(controller),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white70),
                    onPressed: () => _scrollRight(controller),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        movie: movie,
                        movieRepository: movieRepository,
                      ),
                    ),
                  );
                },
                child: _buildMovieCard(movie),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/banner/b_john_wick_4.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "JOHN WICK: CHAPTER 4",
            style: GoogleFonts.oswald(
              textStyle: const TextStyle(
                color: Colors.white70,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.white),
                ),
                child: const Text(
                  "Play",
                  style: TextStyle(color: ColorConstants.primaryText),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {
                  final johnWickMovie = movieRepository.getAllMovies().firstWhere(
                    (movie) => movie.title == "John Wick: Chapter 4",
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        movie: johnWickMovie,
                        movieRepository: movieRepository,
                      ),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: ColorConstants.primaryText),
                ),
                child: const Text(
                  "Details",
                  style: TextStyle(color: ColorConstants.primaryText),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Image.asset(
              movie.poster,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: ColorConstants.primaryText,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "(${movie.year})",
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
