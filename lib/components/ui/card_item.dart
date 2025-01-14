import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_catalog/components/bloc/movie_catalog_bloc.dart';
import 'package:movies_catalog/components/data/movie_model.dart';

class CardItem extends StatefulWidget {
  const CardItem({super.key, required this.movieCardModel});
  final MovieModel movieCardModel;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        // decoration: BoxDecoration(border: Border.all()),
        height: 150,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                    color: widget.movieCardModel.picture,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
              Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.movieCardModel.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              Positioned(
                  right: 1,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'watching':
                          final WatchStatus newWatchStatus = WatchStatus.values
                              .firstWhere((element) => element.name == value);
                          context.read<MoviesCatalogBloc>().add(
                              ChangeMovieWatchStatus(
                                  id: widget.movieCardModel.id,
                                  newWatchStatus: newWatchStatus));
                        case 'watched':
                          final WatchStatus newWatchStatus = WatchStatus.values
                              .firstWhere((element) => element.name == value);
                          context.read<MoviesCatalogBloc>().add(
                              ChangeMovieWatchStatus(
                                  id: widget.movieCardModel.id,
                                  newWatchStatus: newWatchStatus));
                        case 'planned':
                          final WatchStatus newWatchStatus = WatchStatus.values
                              .firstWhere((element) => element.name == value);
                          context.read<MoviesCatalogBloc>().add(
                              ChangeMovieWatchStatus(
                                  id: widget.movieCardModel.id,
                                  newWatchStatus: newWatchStatus));
                        default:
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(value: 'watching', child: Text('Watching')),
                      PopupMenuItem(value: 'watched', child: Text('Watched')),
                      PopupMenuItem(value: 'planned', child: Text('Planned'))
                    ],
                    icon: Icon(Icons.more_vert),
                  ))
            ]),
            Text(
              widget.movieCardModel.title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
