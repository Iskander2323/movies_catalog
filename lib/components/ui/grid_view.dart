import 'package:flutter/material.dart';
import 'package:movies_catalog/components/data/movie_card_model.dart';
import 'package:movies_catalog/components/ui/card_item.dart';

class MoviesGridView extends StatefulWidget {
  const MoviesGridView({super.key});

  @override
  State<MoviesGridView> createState() => _MoviesGridViewState();
}

class _MoviesGridViewState extends State<MoviesGridView> {
  final List<MovieCardModel> movies = [
    MovieCardModel(
        title: 'The Great Adventure', picture: Colors.red, rating: 4.5),
    MovieCardModel(title: 'Star Battles', picture: Colors.blue, rating: 3.8),
    MovieCardModel(title: 'Mystery Island', picture: Colors.green, rating: 4.2),
    MovieCardModel(title: 'Dream Catcher', picture: Colors.orange, rating: 4.9),
    MovieCardModel(
        title: 'Superhero Squad', picture: Colors.purple, rating: 3.5),
    MovieCardModel(title: 'Planet Unknown', picture: Colors.cyan, rating: 4.7),
    MovieCardModel(
        title: 'Legend of the Forest', picture: Colors.brown, rating: 4.0),
    MovieCardModel(title: 'Cosmic Wars', picture: Colors.indigo, rating: 3.9),
    MovieCardModel(
        title: 'Echo of Eternity', picture: Colors.teal, rating: 4.8),
    MovieCardModel(title: 'Shadow Realm', picture: Colors.yellow, rating: 4.3),
    MovieCardModel(
        title: 'The Great Adventure', picture: Colors.red, rating: 4.5),
    MovieCardModel(title: 'Star Battles', picture: Colors.blue, rating: 3.8),
    MovieCardModel(title: 'Mystery Island', picture: Colors.green, rating: 4.2),
    MovieCardModel(title: 'Dream Catcher', picture: Colors.orange, rating: 4.9),
    MovieCardModel(
        title: 'Superhero Squad', picture: Colors.purple, rating: 3.5),
    MovieCardModel(title: 'Planet Unknown', picture: Colors.cyan, rating: 4.7),
    MovieCardModel(
        title: 'Legend of the Forest', picture: Colors.brown, rating: 4.0),
    MovieCardModel(title: 'Cosmic Wars', picture: Colors.indigo, rating: 3.9),
    MovieCardModel(
        title: 'Echo of Eternity', picture: Colors.teal, rating: 4.8),
    MovieCardModel(title: 'Shadow Realm', picture: Colors.yellow, rating: 4.3),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.6),
      itemBuilder: (context, index) {
        return CardItem(movieCardModel: movies[index]);
      },
      itemCount: movies.length,
    );
  }
}
