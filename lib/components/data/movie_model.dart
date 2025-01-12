import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum WatchStatus { watching, watched, planned }

class MovieModel extends Equatable {
  const MovieModel(
      {required this.id,
      required this.title,
      required this.picture,
      required this.rating,
      required this.watchStatus});

  final int id;
  final String title;
  final Color picture;
  final double rating;
  final WatchStatus watchStatus;

  @override
  List<Object?> get props => [id, title, picture, rating, watchStatus];
}
