// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common widgets/lottie_loading_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

//? more preferences can be added later on in the list if needed
  Future<List<bool>> getPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('hasSeenOnBoarding') ?? false;
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return [hasSeenOnboarding, isLoggedIn];
  }

  Widget _buildLottieAnimation() {
    return const LottieLoadingAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<bool>>(
      future: getPreferences(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLottieAnimation();
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox.shrink(); // In case of no data
        }

        bool hasSeenOnboarding = snapshot.data![0];
        bool isLoggedIn = snapshot.data![1];

        // Delay before navigation to show the animation
        Future.delayed(const Duration(seconds: 2), () {
          if (!hasSeenOnboarding) {
            context.go('/boarding');
          } else if (!isLoggedIn) {
            context.go('/login');
          } else {
            context.go('/home');
          }
        });

        return _buildLottieAnimation(); // Show animation while processing
      },
    );
  }
}
