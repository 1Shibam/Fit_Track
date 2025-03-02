import 'package:be_fit/core/constants/theme.dart';
import 'package:be_fit/data/data_sources/remote/firebase_options.dart';
import 'package:be_fit/presentation/providers/router/app_route_config.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//! I completed the Authentication today, today was a tough day i had negative thougts that
//life mean nothing but then whatever who cars
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
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
            theme: appTheme);
      },
    );
  }
}
