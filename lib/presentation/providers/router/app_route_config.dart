import 'package:be_fit/presentation/screens/auth/screens/login_page.dart';
import 'package:be_fit/presentation/screens/auth/screens/signup_page.dart';
import 'package:be_fit/presentation/screens/auth/screens/signup_with_phone.dart';

import 'package:be_fit/presentation/screens/complete_profile_view/complete_profile.dart';
import 'package:be_fit/presentation/screens/home/home_screen.dart';
import 'package:be_fit/presentation/screens/on%20boarding/on_boarding_view.dart';
import 'package:be_fit/presentation/screens/splash/splash_screen.dart';
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
  GoRoute(
    path: '/completeProfile',
    builder: (context, state) {
      return const CompleteProfileView();
    },
  ),
  GoRoute(
    path: '/phoneSignup',
    builder: (context, state) {
      return const SignupWithPhone();
    },
  ),
]);
