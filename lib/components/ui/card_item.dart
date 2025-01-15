import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_catalog/components/bloc/movie_catalog_bloc.dart';
import 'package:movies_catalog/components/data/movie_model.dart';
import 'package:movies_catalog/components/extensions/string_extensions.dart';

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
                      final WatchStatus newWatchStatus = WatchStatus.values
                          .firstWhere((element) => element.name == value);
                      context.read<MoviesCatalogBloc>().add(
                          ChangeMovieWatchStatus(
                              id: widget.movieCardModel.id,
                              newWatchStatus: newWatchStatus,
                              oldWatchStatus:
                                  widget.movieCardModel.watchStatus));
                    },
                    itemBuilder: (context) => WatchStatus.values.map((status) {
                      return PopupMenuItem(
                        value: status.name,
                        child: Text(status.name.toCapitalized()),
                      );
                    }).toList(),
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
