import 'package:go_router/go_router.dart';
import 'package:movies_catalog/components/home_page.dart';

final GoRouter routes = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    builder: (context, state) => HomePage(),
  )
]);
