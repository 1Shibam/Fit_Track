// ignore_for_file: use_build_context_synchronously

import 'package:be_fit/presentation/widgets/common%20widgets/lottie_loading_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnBoarding = prefs.getBool('hasSeenOnBoarding') ?? false;

    final user = FirebaseAuth.instance.currentUser;

    if (context.mounted) {
      if (!hasSeenOnBoarding) {
        context.go('/boarding');
      } else if (user != null && user.emailVerified) {
        context.go('/home');
      } else {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:  LottieLoadingAnimation()),
    );
  }
}
