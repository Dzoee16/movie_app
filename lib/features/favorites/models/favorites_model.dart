// favorites_model.dart
class Movie {
  final String title;
  final String year;
  final String posterUrl;
  bool isFavorite;

  Movie({
    required this.title,
    required this.year,
    required this.posterUrl,
    this.isFavorite = false,
  });
}
