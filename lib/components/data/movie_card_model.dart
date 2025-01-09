import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MovieCardModel extends Equatable {
  const MovieCardModel(
      {required this.title, required this.picture, required this.rating});

  final String title;
  final Color picture;
  final double rating;

  @override
  List<Object?> get props => [title, picture, rating];
}
