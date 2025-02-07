import 'package:be_fit/view/auth/login_page.dart';
import 'package:be_fit/view/auth/signup_page.dart';
import 'package:be_fit/view/home/home_screen.dart';
import 'package:be_fit/view/on%20boarding/on_boarding_view.dart';
import 'package:be_fit/view/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) {
      return const LoginPage();
    },
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) {
      return const SignUpPage();
    },
  ),
  GoRoute(
    path: '/boarding',
    builder: (context, state) {
      return const OnBoardingView();
    },
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) {
      return const HomeScreen();
    },
  ),
]);
