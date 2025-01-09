import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_catalog_event.dart';
part 'movie_catalog_state.dart';

class MoviesCatalogBloc extends Bloc<MoviesCatalogEvent, MoviesCatalogState> {
  MoviesCatalogBloc() : super(MovieCatalogInitial()) {
    on<MoviesCatalogEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
