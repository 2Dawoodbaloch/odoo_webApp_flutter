import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  // Space values
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 40;

  // static const double spaceBtwEntries = 8;
    static const double spaceBtwInputFields = 8;
    
    // space btw right and left columns in rows
    static const double spaceBtwSections = 30;

  // Screen padding
  static const EdgeInsets mobilePadding = EdgeInsets.all(16);

  static const EdgeInsets tabletPadding = EdgeInsets.all(20);

  static const EdgeInsets desktopPadding = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 8,
  );

  // Common padding
  static const EdgeInsets containerPadding = EdgeInsets.all(16);

  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(
    horizontal: 16,
  );

  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 16);

  // container padding horizental + vertical
  static const EdgeInsets bigContainer = EdgeInsets.symmetric(
    vertical: 24,
    horizontal: 24,
  );
}
