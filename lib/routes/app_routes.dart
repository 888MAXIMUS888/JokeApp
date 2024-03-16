import 'package:go_router/go_router.dart';
import 'package:joke_app/presentation/views/category_joke/category_joke_view.dart';
import 'package:joke_app/presentation/views/main_view.dart';
import 'package:joke_app/routes/routes.provider.dart';
import 'package:joke_app/routes/routes_location.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: MainView.builder,
  ),
  GoRoute(
    path: RouteLocation.categoryJoke,
    parentNavigatorKey: navigationKey,
    builder: CategoryJokeView.builder,
  ),
];
