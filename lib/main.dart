import 'package:flutter/material.dart';
import 'package:movies_catalog/app.dart';
import 'package:movies_catalog/components/repository/movie_status_repository.dart';

void main() {
  final WatchMovieStatusRepository watchMovieStatusRepository =
      WatchMovieStatusRepository();
  runApp(App(watchMovieStatusRepository: watchMovieStatusRepository));
}
