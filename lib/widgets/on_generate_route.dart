import 'package:flutter/material.dart';

import 'package:my_website/settings/constants.dart';

import 'package:my_website/pages/home.dart';
import 'package:my_website/pages/one.dart';
import 'package:my_website/pages/two.dart';
import 'package:my_website/pages/three.dart';

class PagesRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kHomePageRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomePage(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      case kPageOneRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => PageOne(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      case kPageTwoRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => PageTwo(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      case kPageThreeRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => PageThree(),
          settings: settings,
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      default:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => HomePage());
    }
  }
}
