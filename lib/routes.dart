import 'package:go_router/go_router.dart';
import 'package:movies_catalog/components/home_page.dart';
import 'package:movies_catalog/components/ui/movie_card_page/movie_card_page.dart';

final GoRouter routes = GoRouter(initialLocation: '/home', routes: [
  GoRoute(path: '/home', builder: (context, state) => HomePage(), routes: [
    GoRoute(
      path: 'movie_id',
      name: 'MoviePage',
      builder: (context, state) => MovieCardPage(),
    )
  ])
]);
