import 'package:movies_catalog/components/data/movie_model.dart';

abstract class MovieStatusRepository {
  List<MovieModel> fetchMovies() {
    return [];
  }

  void changeMovieWatchStatus(MovieModel movie) {}
}
