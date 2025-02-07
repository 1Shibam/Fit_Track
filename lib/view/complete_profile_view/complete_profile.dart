import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';
import 'package:be_fit/view/complete_profile_view/complete_profile_widgets/tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/completeProfile.json',
                height: 200.h, width: 200.w),
            SizedBox(
              height: 10.h,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  'Let\'s complete your profile',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading3,
                ),
                Text(
                  'It will help us know more about you!',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body2,
                ),
                ExpansionTile(
                  title: Text(
                    'Gender',
                    style: AppTextStyles.body1,
                  ),
                  backgroundColor:
                      AppColors.secondaryColorCyan.withOpacity(0.4),
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Tiles(
                            tileTitle: 'Male',
                            trailing: Icon(Icons.male),
                          ),
                          Tiles(
                            tileTitle: 'FeMale',
                            trailing: Icon(Icons.female),
                          ),
                          Tiles(
                            tileTitle: 'Male',
                            trailing: Icon(Icons.not_accessible),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
