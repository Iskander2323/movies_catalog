import 'package:flutter/material.dart';
import 'package:movies_catalog/components/data/movie_model.dart';
import 'package:movies_catalog/components/ui/card_item.dart';

class MoviesGridView extends StatefulWidget {
  const MoviesGridView({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<MoviesGridView> createState() => _MoviesGridViewState();
}

class _MoviesGridViewState extends State<MoviesGridView> {
  @override
  Widget build(BuildContext context) {
    if (widget.movies.isNotEmpty) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.6),
        itemBuilder: (context, index) {
          return CardItem(movieCardModel: widget.movies[index]);
        },
        itemCount: widget.movies.length,
      );
    } else {
      return Center(child: Text('ADD MOVIES TO THIS CATEGORY'));
    }
  }
}
