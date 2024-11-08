import 'package:movie_stream/core/data/model/movie.dart';
import 'package:movie_stream/core/global_component/images.dart';

class MovieRepository {
  // List to hold favorite movies
  final List<Movie> _favoriteMovies = [];

  MovieRepository() {
    _initializeFavorites();
  }

  void _initializeFavorites() {
    for (var movie in getAllMovies()) {
      if (movie.isFavorite) {
        _favoriteMovies.add(movie);
      }
    }
  }

  // Fetch current favorites
  List<Movie> fetchFavoriteMovies() {
    return _favoriteMovies; // Return the list of favorite movies
  }

  // Add a movie to favorites
  void addFavorite(Movie movie) {
    if (!_favoriteMovies.contains(movie)) {
      _favoriteMovies.add(movie); // Add movie to the favorites list
      movie.isFavorite = true; // Update the movie's favorite status
    }
  }

  // Remove a movie from favorites
  void removeFavorite(Movie movie) {
    if (_favoriteMovies.contains(movie)) {
      _favoriteMovies.remove(movie); // Remove movie from favorites
      movie.isFavorite = false; // Update the movie's favorite status
    }
  }

  // Dummy data for all movies
  List<Movie> getAllMovies() {
    return [
      Movie(
        title: "John Wick: Chapter 4",
        banner: ImageConstants.bannerJohnWick4,
        poster: ImageConstants.posterJohnWick4,
        year: 2023,
        duration: "2h 49m",
        description: "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.",
        cast: ["Keanu Reeves", "Donnie Yen", "Bill Skarsgård"],
        director: "Chad Stahelski",
        genre: ["Action", "Thriller"],
        ageRating: "18+",
        rating: 7.7,
        isFavorite: true,
      ),
      Movie(
        title: 'Inception',
        banner: ImageConstants.bannerInception,
        poster: ImageConstants.posterInception,
        year: 2010,
        duration: '2h 28m',
        description: "A thief who steals corporate secrets through dream-sharing technology is given the task of planting an idea.",
        cast: ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Ellen Page'],
        director: "Christopher Nolan",
        genre: ["Sci-Fi", "Action"],
        ageRating: "13+",
        rating: 8.8,
        isFavorite: true,
      ),
      Movie(
        title: 'The Fall Guy',
        banner: ImageConstants.bannerTheFallGuy,
        poster: ImageConstants.posterTheFallGuy,
        year: 2024,
        duration: '1h 55m',
        description: "A stuntman must track down a missing movie star and solve a conspiracy.",
        cast: ['Ryan Gosling', 'Emily Blunt', 'Aaron Taylor-Johnson'],
        director: "David Leitch",
        genre: ["Action", "Adventure"],
        ageRating: "15+",
        rating: 6.9,
        isFavorite: true,
      ),
      Movie(
        title: 'Top Gun: Maverick',
        banner: ImageConstants.bannerTopGunMaverick,
        poster: ImageConstants.posterTopGunMaverick,
        year: 2022,
        duration: '2h 11m',
        description: "Maverick confronts his past while training a group of younger Top Gun graduates.",
        cast: ['Tom Cruise', 'Miles Teller', 'Jennifer Connelly'],
        director: "Joseph Kosinski",
        genre: ["Action", "Drama"],
        ageRating: "13+",
        rating: 8.2,
      ),
      Movie(
        title: 'Terrifier 3',
        banner: ImageConstants.bannerTerrifier3,
        poster: ImageConstants.posterTerrifier3,
        year: 2024,
        duration: '1h 38m',
        description: "Art the Clown unleashes chaos on Christmas Eve in Miles County.",
        cast: ['David Howard Thornton', 'Lauren LaVera', 'Elliott Fullam'],
        director: "Damien Leone",
        genre: ["Horror", "Thriller"],
        ageRating: "18+",
        rating: 6.5,
      ),
      Movie(
        title: 'Alien: Romulus',
        banner: ImageConstants.bannerAlienRomulus,
        poster: ImageConstants.posterAlienRomulus,
        year: 2024,
        duration: '2h 10m',
        description: "Young space colonists face the most terrifying life form in the universe.",
        cast: ['Sigourney Weaver', 'Michael Fassbender', 'Katherine Waterston'],
        director: "Fede Álvarez",
        genre: ["Sci-Fi", "Horror"],
        ageRating: "18+",
        rating: 7.2,
        isFavorite: true,
      ),
      Movie(
        title: 'Longlegs',
        banner: ImageConstants.bannerLonglegs,
        poster: ImageConstants.posterLonglegs,
        year: 2024,
        duration: '1h 42m',
        description: "An FBI agent pursues a serial killer with occult clues.",
        cast: ['Nicolas Cage', 'Mandy Moore', 'Ben Mendelsohn'],
        director: "Osgood Perkins",
        genre: ["Horror", "Crime"],
        ageRating: "18+",
        rating: 6.7,
      ),
      Movie(
        title: 'The Wild Robot',
        banner: ImageConstants.bannerTheWildRobot,
        poster: ImageConstants.posterTheWildRobot,
        year: 2024,
        duration: '1h 30m',
        description: "An intelligent robot bonds with animals on an uninhabited island.",
        cast: ['Brie Larson', 'Tom Holland', 'Emma Stone'],
        director: "Chris Wedge",
        genre: ["Animation", "Adventure"],
        ageRating: "PG",
        rating: 8.3,
      ),
      Movie(
        title: 'Venom: Last Dance',
        banner: ImageConstants.bannerVenomLastDance,
        poster: ImageConstants.posterVenomLastDance,
        year: 2024,
        duration: '1h 57m',
        description: "Eddie and Venom face a tough decision that could end their partnership.",
        cast: ['Tom Hardy', 'Woody Harrelson', 'Michelle Williams'],
        director: "Andy Serkis",
        genre: ["Action", "Sci-Fi"],
        ageRating: "15+",
        rating: 6.2,
      ),
      Movie(
        title: 'Transformers: One',
        banner: ImageConstants.bannerTransformerOne,
        poster: ImageConstants.posterTransformerOne,
        year: 2023,
        duration: '2h 12m',
        description: "The origin story of Optimus Prime and Megatron, once friends.",
        cast: ['Mark Wahlberg', 'Anthony Ramos', 'Dominique Fishback'],
        director: "Steven Caple Jr.",
        genre: ["Sci-Fi", "Action"],
        ageRating: "13+",
        rating: 7.7,
      ),
      Movie(
        title: 'Breaking Bad',
        banner: ImageConstants.bannerBreakingBad,
        poster: ImageConstants.posterBreakingBad,
        year: 2008,
        duration: '49m',
        description: "A teacher turns to manufacturing meth to secure his family's future.",
        cast: ['Bryan Cranston', 'Aaron Paul', 'Anna Gunn'],
        director: "Vince Gilligan",
        genre: ["Crime", "Drama"],
        ageRating: "18+",
        rating: 9.5,
        isFavorite: true,
      ),
      Movie(
        title: 'Game of Thrones',
        banner: ImageConstants.bannerGameOfThrones,
        poster: ImageConstants.posterGameOfThrones,
        year: 2011,
        duration: '1h',
        description: "Noble families fight for control of Westeros as an ancient enemy returns.",
        cast: ['Emilia Clarke', 'Kit Harington', 'Peter Dinklage'],
        director: "David Benioff & D.B. Weiss",
        genre: ["Fantasy", "Drama"],
        ageRating: "18+",
        rating: 9.2,
      ),
      Movie(
        title: 'Peaky Blinders',
        banner: ImageConstants.bannerPeakyBlinders,
        poster: ImageConstants.posterPeakyBlinders,
        year: 2013,
        duration: '1h',
        description: "A gangster family in 1900s England navigates power struggles.",
        cast: ['Cillian Murphy', 'Paul Anderson', 'Helen McCrory'],
        director: "Steven Knight",
        genre: ["Crime", "Drama"],
        ageRating: "18+",
        rating: 8.7,
        isFavorite: true,
      ),
      Movie(
        title: 'The Penguin',
        banner: ImageConstants.bannerThePenguin,
        poster: ImageConstants.posterThePenguin,
        year: 2024,
        duration: '50m',
        description: "The Penguin attempts to seize control of Gotham's crime world.",
        cast: ['Colin Farrell', 'Kristin Chenoweth', 'Clancy Brown'],
        director: "Matt Reeves",
        genre: ["Crime", "Drama"],
        ageRating: "18+",
        rating: 8.8,
      ),
      Movie(
        title: 'The Boys',
        banner: ImageConstants.bannerTheBoys,
        poster: ImageConstants.posterTheBoys,
        year: 2019,
        duration: '1h',
        description: "Vigilantes aim to take down corrupt superheroes.",
        cast: ['Karl Urban', 'Jack Quaid', 'Antony Starr'],
        director: "Eric Kripke",
        genre: ["Action", "Comedy"],
        ageRating: "18+",
        rating: 8.7,
      ),
    ];
  }
}
