import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            children: const [],
          ),
        ),
        //! Smooth Page Indicator
        SmoothPageIndicator(
          controller: pageController,
          count: 3, // Total pages
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.blue, // Change to match your theme
            dotColor: Colors.grey.shade400,
          ),
        ),
        const SizedBox(height: 40),
      ],
    ));
  }
}
