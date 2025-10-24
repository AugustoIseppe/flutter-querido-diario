import 'package:go_router/go_router.dart';
import 'package:querido_diario/app/ui/pages/splash_page.dart';
import 'package:querido_diario/app/ui/pages/home_page.dart';

final routes = GoRouter(
  initialLocation: '/splash-page',
  routes: [
    GoRoute(path: '/splash-page', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/home-page', builder: (context, state) => const HomePage()),
  ],
);