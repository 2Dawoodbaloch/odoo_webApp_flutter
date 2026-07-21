import 'package:flutter/material.dart';

enum AppScreenType { mobile, tablet, desktop }

class Responsive {
  Responsive._();

  static const mobileMax = 600;
  static const tabletMax = 1024;

  static AppScreenType screenTypeOf(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= tabletMax) return AppScreenType.desktop;
    if (width >= mobileMax) return AppScreenType.tablet;
    return AppScreenType.mobile;
  }

  static bool isMobile(BuildContext context) =>
      screenTypeOf(context) == AppScreenType.mobile;

  static bool isTablet(BuildContext context) =>
      screenTypeOf(context) == AppScreenType.tablet;

  static bool isDesktop(BuildContext context) =>
      screenTypeOf(context) == AppScreenType.desktop;
}
