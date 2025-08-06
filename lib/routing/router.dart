import 'package:go_router/go_router.dart';
import 'package:mvvm_learn/routing/routes.dart';
import 'package:mvvm_learn/ui/home/widgets/home_screen.dart';

GoRouter router() => GoRouter(initialLocation: Routes.home, routes: [GoRoute(path: Routes.home, builder:  (context, state) {
  return HomeScreen();
})]);
