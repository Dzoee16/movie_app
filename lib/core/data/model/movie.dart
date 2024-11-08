class Movie {
  final String title;
  final String banner;
  final String poster;
  final int year;
  final String duration;
  final String description;
  final List<String> cast;
  final String director;
  final List<String> genre;
  final String ageRating;
  final double rating;
  bool isFavorite;

  Movie({
    required this.title,
    required this.banner,
    required this.poster,
    required this.year,
    required this.duration,
    required this.description,
    required this.cast,
    required this.director,
    required this.genre,
    required this.ageRating,
    required this.rating,
    this.isFavorite = false,
  });

  // Method untuk mengubah status isFavorite
  void toggleFavorite() {
    isFavorite = !isFavorite; 
  }
}
