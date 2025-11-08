import 'package:go_router/go_router.dart';
import 'package:myapp/src/presentation/screens/dashboard_screen.dart';
import 'package:myapp/src/presentation/screens/login_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);
