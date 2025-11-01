import 'package:go_router/go_router.dart';
import 'package:querido_diario/app/auth/auth_gate.dart';
import 'package:querido_diario/app/ui/components/home_dashboard.dart';
import 'package:querido_diario/app/ui/pages/home_page.dart';

final routes = GoRouter(
  initialLocation: '/auth-gate',
  routes: [
    GoRoute(path: '/auth-gate', builder: (context, state) => const AuthGate()),
    GoRoute(path: '/home-dashboard', builder: (context, state) => const HomeDashboard()),
    GoRoute(path: '/home-page', builder: (context, state) => const HomePage()),
  ],
);