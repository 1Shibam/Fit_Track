
import 'package:be_fit/common/theme.dart';
import 'package:be_fit/router/app_route_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: goRouter,

          debugShowCheckedModeBanner: false,
          title: 'Be-Fit',
          theme: appTheme
          
        );
      },
    );
  }
}
