import 'package:flutter/material.dart';
import 'package:movies_catalog/components/data/movie_model.dart';
import 'package:movies_catalog/components/ui/card_item.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    if (movies.isNotEmpty) {
      return CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${movies.length}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: 'Title',
                    child: Text('Sort by Title'),
                  ),
                  DropdownMenuItem(
                    value: 'Rating',
                    child: Text('Sort by Rating'),
                  ),
                  DropdownMenuItem(
                    value: 'Date',
                    child: Text('Sort by Release Date'),
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.6,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return CardItem(movieCardModel: movies[index]);
            },
            childCount: movies.length,
          ),
        ),
      ]);
    } else {
      return Center(child: Text('ADD MOVIES TO THIS CATEGORY'));
    }
  }
}
