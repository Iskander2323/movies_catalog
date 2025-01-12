import 'package:flutter/material.dart';
import 'package:movies_catalog/components/abstract/repository_interface.dart';
import 'package:movies_catalog/components/data/movie_model.dart';

class WatchMovieStatusRepository implements MovieStatusRepository {
  @override
  List<MovieModel> fetchMovies() {
    final List<MovieModel> movies = [
      MovieModel(
          id: 1,
          title: 'The Great Adventure',
          picture: Colors.red,
          rating: 4.5,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 2,
          title: 'Star Battles',
          picture: Colors.blue,
          rating: 3.8,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 3,
          title: 'Mystery Island',
          picture: Colors.green,
          rating: 4.2,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 4,
          title: 'Dream Catcher',
          picture: Colors.orange,
          rating: 4.9,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 5,
          title: 'Superhero Squad',
          picture: Colors.purple,
          rating: 3.5,
          watchStatus: WatchStatus.watched),
      MovieModel(
          id: 6,
          title: 'Planet Unknown',
          picture: Colors.cyan,
          rating: 4.7,
          watchStatus: WatchStatus.watched),
      MovieModel(
          id: 7,
          title: 'Legend of the Forest',
          picture: Colors.brown,
          rating: 4.0,
          watchStatus: WatchStatus.watched),
      MovieModel(
          id: 8,
          title: 'Cosmic Wars',
          picture: Colors.indigo,
          rating: 3.9,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 9,
          title: 'Echo of Eternity',
          picture: Colors.teal,
          rating: 4.8,
          watchStatus: WatchStatus.watched),
      MovieModel(
          id: 10,
          title: 'Shadow Realm',
          picture: Colors.yellow,
          rating: 4.3,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 11,
          title: 'The Great Adventure 2',
          picture: Colors.red,
          rating: 4.5,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 12,
          title: 'Star Battles 2',
          picture: Colors.blue,
          rating: 3.8,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 13,
          title: 'Mystery Island 2',
          picture: Colors.green,
          rating: 4.2,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 14,
          title: 'Dream Catcher 2',
          picture: Colors.orange,
          rating: 4.9,
          watchStatus: WatchStatus.planned),
      MovieModel(
          id: 15,
          title: 'Superhero Squad 2',
          picture: Colors.purple,
          rating: 3.5,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 16,
          title: 'Planet Unknown 2',
          picture: Colors.cyan,
          rating: 4.7,
          watchStatus: WatchStatus.planned),
      MovieModel(
          id: 17,
          title: 'Legend of the Forest 2',
          picture: Colors.brown,
          rating: 4.0,
          watchStatus: WatchStatus.planned),
      MovieModel(
          id: 18,
          title: 'Cosmic Wars 2',
          picture: Colors.indigo,
          rating: 3.9,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 19,
          title: 'Echo of Eternity 2',
          picture: Colors.teal,
          rating: 4.8,
          watchStatus: WatchStatus.watching),
      MovieModel(
          id: 20,
          title: 'Shadow Realm 2',
          picture: Colors.yellow,
          rating: 4.3,
          watchStatus: WatchStatus.planned),
    ];
    return movies;
  }

  @override
  void changeMovieWatchStatus(MovieModel movie) {}
}
