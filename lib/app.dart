import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_catalog/components/bloc/movie_catalog_bloc.dart';
import 'package:movies_catalog/components/repository/movie_status_repository.dart';
import 'package:movies_catalog/routes.dart';

class App extends StatelessWidget {
  const App({super.key, required this.watchMovieStatusRepository});

  final WatchMovieStatusRepository watchMovieStatusRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesCatalogBloc(moviesStatusRepository: watchMovieStatusRepository),
      child: Builder(
        builder: (context) {
          context.read<MoviesCatalogBloc>().add(FetchMoviesEvent());
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: routes,
          );
        },
      ),
    );
  }
}
