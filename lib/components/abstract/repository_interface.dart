import 'package:movies_catalog/components/data/movie_model.dart';

abstract class MovieStatusRepositoryInterface {
  List<MovieModel> fetchMovies() {
    return [];
  }

  void changeMovieWatchStatus(MovieModel movie) {}
}
