// home_model.dart
import 'package:movie_stream/core/data/model/movie.dart';

class HomeModel {
  final List<Movie> trendingMovies;
  final List<Movie> newReleases;
  final List<Movie> series;

  HomeModel({
    required this.trendingMovies,
    required this.newReleases,
    required this.series,
  });
}
