import 'package:be_fit/common/text_style.dart';
import 'package:flutter/material.dart';

class OnBoardingPages extends StatelessWidget {
  final String title;
  final String imagePath;
  final String? subtitle;
  final ElevatedButton? button;

  const OnBoardingPages({
    super.key,
    required this.title,
    required this.imagePath,
    this.subtitle,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 12),
            Text(title, style: AppTextStyles.heading3),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(subtitle!, style: AppTextStyles.body1, textAlign: TextAlign.center),
              ),
            const SizedBox(height: 12),
            button ?? const SizedBox.shrink(), // Avoids extra space if button is null
          ],
        ),
      ),
    );
  }
}
