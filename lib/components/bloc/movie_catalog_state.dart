part of 'movie_catalog_bloc.dart';

sealed class MoviesCatalogState extends Equatable {
  const MoviesCatalogState();

  @override
  List<Object> get props => [];
}

final class MovieCatalogInitial extends MoviesCatalogState {}
