import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoadingAnimation extends StatelessWidget {
  const LottieLoadingAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Lottie.asset('assets/animations/fitness lottie json.json'),
      ),
    );
  }
}
