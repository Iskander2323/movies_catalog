import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_catalog/components/bloc/movie_catalog_bloc.dart';
import 'package:movies_catalog/components/ui/grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'MoviesCatalog',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.purple,
            bottom: TabBar(
              tabs: [
                Text(
                  'Смотрю',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Просмотрено',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'В планах',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          body: BlocBuilder<MoviesCatalogBloc, MoviesCatalogState>(
            builder: (context, state) {
              switch (state.status) {
                case MovieCatalogStatus.initial:
                  return Center(child: CircularProgressIndicator());
                case MovieCatalogStatus.failure:
                  return Center(
                    child: Text('ERROR'),
                  );
                case MovieCatalogStatus.success:
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: TabBarView(children: [
                      MoviesGridView(
                        movies: state.watchingMoviesList,
                      ),
                      MoviesGridView(
                        movies: state.watchedMoviesList,
                      ),
                      MoviesGridView(
                        movies: state.plannedMoviesList,
                      ),
                    ]),
                  );
              }
            },
          )),
    );
  }
}
