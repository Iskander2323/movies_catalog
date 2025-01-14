import 'dart:core';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_catalog/components/abstract/repository_interface.dart';
import 'package:movies_catalog/components/data/movie_model.dart';

part 'movie_catalog_event.dart';
part 'movie_catalog_state.dart';

class MoviesCatalogBloc extends Bloc<MoviesCatalogEvent, MoviesCatalogState> {
  final MovieStatusRepositoryInterface _moviesStatusRepository;
  MoviesCatalogBloc(
      {required MovieStatusRepositoryInterface moviesStatusRepository})
      : _moviesStatusRepository = moviesStatusRepository,
        super(MoviesCatalogState()) {
    on<FetchMoviesEvent>(_fetchMoviesNew);
    on<ChangeMovieWatchStatus>(_changeMovieWatchStatus);
  }

  void _fetchMoviesNew(
      FetchMoviesEvent event, Emitter<MoviesCatalogState> emit) {
    try {
      final movies = _moviesStatusRepository.fetchMovies();
      final moviesByWatchCategoriesMap = <WatchStatus, List<MovieModel>>{};
      for (var movie in movies) {
        final status = movie.watchStatus;
        moviesByWatchCategoriesMap.putIfAbsent(status, () => []).add(movie);
      }

      emit(state.copyWith(
          status: MovieCatalogStatus.success,
          moviesByWatchCategoriesMap: moviesByWatchCategoriesMap));
    } on Exception catch (e) {
      log(e.toString(), name: 'MOVIES CATALOG BLOC FETCH MOVIES');
      emit(state.copyWith(status: MovieCatalogStatus.failure));
    }
  }

  void _changeMovieWatchStatus(
      ChangeMovieWatchStatus event, Emitter<MoviesCatalogState> emit) {
    final updatedMoviesByCategoriesMap =
        Map<WatchStatus, List<MovieModel>>.from(
            state.moviesByWatchCategoriesMap);
    final updatedMovie = state.moviesByWatchCategoriesMap[event.oldWatchStatus]!
        .firstWhere((movie) => movie.id == event.id)
        .copyWith(watchStatus: event.newWatchStatus);
    updatedMoviesByCategoriesMap[event.oldWatchStatus]!
        .removeWhere((movie) => movie.id == event.id);
    updatedMoviesByCategoriesMap[event.newWatchStatus]?.add(updatedMovie);

    emit(state.copyWith(
        moviesByWatchCategoriesMap: updatedMoviesByCategoriesMap));
  }
}
