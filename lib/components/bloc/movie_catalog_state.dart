part of 'movie_catalog_bloc.dart';

enum MovieCatalogStatus { initial, success, failure }

final class MoviesCatalogState extends Equatable {
  const MoviesCatalogState(
      {this.status = MovieCatalogStatus.initial,
      this.watchedMoviesList = const <MovieModel>[],
      this.watchingMoviesList = const <MovieModel>[],
      this.plannedMoviesList = const <MovieModel>[]});

  MoviesCatalogState copyWith({
    MovieCatalogStatus? status,
    List<MovieModel>? watchingMoviesList,
    List<MovieModel>? watchedMoviesList,
    List<MovieModel>? plannedMoviesList,
  }) {
    return MoviesCatalogState(
      status: status ?? this.status,
      watchingMoviesList: watchingMoviesList ?? this.watchingMoviesList,
      watchedMoviesList: watchedMoviesList ?? this.watchedMoviesList,
      plannedMoviesList: plannedMoviesList ?? this.plannedMoviesList,
    );
  }

  final MovieCatalogStatus status;
  final List<MovieModel> watchingMoviesList;
  final List<MovieModel> watchedMoviesList;
  final List<MovieModel> plannedMoviesList;

  @override
  List<Object> get props =>
      [status, watchingMoviesList, watchedMoviesList, plannedMoviesList];
}
