part of 'movie_catalog_bloc.dart';

enum MovieCatalogStatus { initial, success, failure, loading }

final class MoviesCatalogState extends Equatable {
  const MoviesCatalogState({
    this.status = MovieCatalogStatus.initial,
    this.moviesByWatchCategoriesMap = const <WatchStatus, List<MovieModel>>{},
  });

  MoviesCatalogState copyWith({
    MovieCatalogStatus? status,
    Map<WatchStatus, List<MovieModel>>? moviesByWatchCategoriesMap,
  }) {
    return MoviesCatalogState(
      status: status ?? this.status,
      moviesByWatchCategoriesMap:
          moviesByWatchCategoriesMap ?? this.moviesByWatchCategoriesMap,
    );
  }

  final MovieCatalogStatus status;
  final Map<WatchStatus, List<MovieModel>> moviesByWatchCategoriesMap;

  @override
  List<Object> get props => [status, moviesByWatchCategoriesMap];
}
