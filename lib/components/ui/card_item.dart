import 'package:flutter/material.dart';
import 'package:movies_catalog/components/data/movie_card_model.dart';

class CardItem extends StatefulWidget {
  const CardItem({super.key, required this.movieCardModel});
  final MovieCardModel movieCardModel;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
                color: widget.movieCardModel.picture,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Text(widget.movieCardModel.title),
        ],
      ),
    );
  }
}
