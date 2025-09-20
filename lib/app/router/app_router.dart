import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/assessment/presentation/assessment_detail_screen.dart';
import '../../features/auth/data/auth_service.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isLoggedIn = authState.value != null;
      final isOnLogin = state.uri.path == '/login';
      final isOnSplash = state.uri.path == '/splash';

      // If user is logged in and on login/splash, redirect to home
      if (isLoggedIn && (isOnLogin || isOnSplash)) {
        return '/home';
      }

      // If user is not logged in and not on login/splash, redirect to login
      if (!isLoggedIn && !isOnLogin && !isOnSplash) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/assessment/:id',
        builder: (context, state) => AssessmentDetailScreen(
          id: state.pathParameters['id']!,
        ),
      ),
    ],
  );
});
