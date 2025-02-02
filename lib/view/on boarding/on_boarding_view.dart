import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';
import 'package:be_fit/view/on%20boarding/on_boarding_pages.dart';
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
  void dispose() {
    //!implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              const OnBoardingPages(
                  title: 'Welcome to FitTrack!',
                  imagePath: 'assets/images/welcome.png'),
              const OnBoardingPages(
                  title: 'Track Your Progress',
                  imagePath: 'assets/images/track.png'),
              const OnBoardingPages(
                  title: 'Set Your Fitness Goals',
                  imagePath: 'assets/images/goals.png'),
              const OnBoardingPages(
                  title: 'Track Nutrition',
                  imagePath: 'assets/images/food.png'),
              const OnBoardingPages(
                  title: 'Sync with Health Devices',
                  imagePath: 'assets/images/devices.png'),
              const OnBoardingPages(
                  title: 'Get reminders to keep pushing toward your goals.',
                  imagePath: 'assets/images/stay motivated.png'),
              OnBoardingPages(
                title: 'Start Your Journey!',
                imagePath: 'assets/images/start.png',
                button: ElevatedButton(
                    style: const ButtonStyle(
                        foregroundColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        shadowColor:
                            WidgetStatePropertyAll(Colors.transparent)),
                    onPressed: () {},
                    child: const Text(
                      'Get Started',
                      style: AppTextStyles.heading3,
                    )),
              )
            ],
          ),
        ),
        //! Smooth Page Indicator
        SmoothPageIndicator(
          onDotClicked: (index) {
            pageController.jumpToPage(index);
          },
          controller: pageController,
          count: 7, // Total pages
          effect: WormEffect(
            radius: 20,
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.blue, // Change to match your theme
            dotColor: AppColors.neutralColorMediumGray,
          ),
        ),
        const SizedBox(height: 40),
      ],
    ));
  }
}
