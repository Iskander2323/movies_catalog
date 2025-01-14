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
    on<ChangeMovieWatchStatus>(_changeMovieWatchStatus);
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
      emit(state.copyWith(
          status: MovieCatalogStatus.success,
          allMovies: movies,
          watchingMoviesList: watchingMovies,
          watchedMoviesList: watchedMovies,
          plannedMoviesList: plannedMovies));
    } on Exception catch (e) {
      log(e.toString(), name: 'MOVIES CATALOG BLOC FETCH MOVIES');
      emit(state.copyWith(status: MovieCatalogStatus.failure));
    }
  }

  void _changeMovieWatchStatus(
      ChangeMovieWatchStatus event, Emitter<MoviesCatalogState> emit) {
    final List<MovieModel> updatedMoviesList = state.allMovies.map((movie) {
      if (movie.id == event.id) {
        return movie.copyWith(watchStatus: event.newWatchStatus);
      } else {
        return movie;
      }
    }).toList();
    final watchingMovies = updatedMoviesList
        .where((movies) => movies.watchStatus == WatchStatus.watching)
        .toList();
    final watchedMovies = updatedMoviesList
        .where((movies) => movies.watchStatus == WatchStatus.watched)
        .toList();
    final plannedMovies = updatedMoviesList
        .where((movies) => movies.watchStatus == WatchStatus.planned)
        .toList();
    emit(state.copyWith(
        allMovies: updatedMoviesList,
        watchingMoviesList: watchingMovies,
        watchedMoviesList: watchedMovies,
        plannedMoviesList: plannedMovies));
  }
}
