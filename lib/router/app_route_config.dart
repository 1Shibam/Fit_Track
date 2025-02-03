import 'package:be_fit/view/on%20boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FitTrackRouter {
  GoRouter router = GoRouter(routes: [
    // this will have the route of all the pages or links of those pages which will be in the form of go route

    GoRoute(path:  '/', name: 'signup', builder: (context, state) {
      return MaterialPage(child: OnBoardingView());
    },)
  ]);
}
