import 'dart:core';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_catalog/components/abstract/repository_interface.dart';
import 'package:movies_catalog/components/data/movie_model.dart';
import 'package:movies_catalog/components/repository/movie_status_repository.dart';

part 'movie_catalog_event.dart';
part 'movie_catalog_state.dart';

class MoviesCatalogBloc extends Bloc<MoviesCatalogEvent, MoviesCatalogState> {
  final MovieStatusRepository _moviesStatusRepository;
  MoviesCatalogBloc(
      {required WatchMovieStatusRepository moviesStatusRepository})
      : _moviesStatusRepository = moviesStatusRepository,
        super(MoviesCatalogState()) {
    on<FetchMoviesEvent>(_fetchMovies);
  }

  void _fetchMovies(FetchMoviesEvent event, Emitter<MoviesCatalogState> emit) {
    try {
      final movies = _moviesStatusRepository.fetchMovies();
      final watchingMovies = movies
          .where((movies) => movies.watchStatus == WatchStatus.watching)
          .toList();
      final watchedMovies = movies
          .where((movies) => movies.watchStatus == WatchStatus.watched)
          .toList();
      final plannedMovies = movies
          .where((movies) => movies.watchStatus == WatchStatus.planned)
          .toList();
      log(watchingMovies.toString());
      log(watchedMovies.toString());
      log(plannedMovies.toString());
      emit(state.copyWith(
          status: MovieCatalogStatus.success,
          watchingMoviesList: watchingMovies,
          watchedMoviesList: watchedMovies,
          plannedMoviesList: plannedMovies));
    } on Exception catch (e) {
      log(e.toString(), name: 'MOVIES CATALOG BLOC FETCH MOVIES');
      emit(state.copyWith(status: MovieCatalogStatus.failure));
    }
  }
}
