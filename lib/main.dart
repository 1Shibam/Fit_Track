import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/view/on%20boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be-Fit',
      theme: ThemeData(
          primaryColor: AppColors.primaryColorRed,
          useMaterial3: true,
          fontFamily: 'Lexend'),
          
      home: const OnBoardingView(),
    );
  }
}
