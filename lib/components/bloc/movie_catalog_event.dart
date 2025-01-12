part of 'movie_catalog_bloc.dart';

sealed class MoviesCatalogEvent extends Equatable {
  const MoviesCatalogEvent();

  @override
  List<Object> get props => [];
}

final class FetchMoviesEvent extends MoviesCatalogEvent {}

final class ChangeMovieWatchStatus extends MoviesCatalogEvent {
  const ChangeMovieWatchStatus({required this.id});
  final int id;
}
