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

  /// Space between the top navigation bar and the breadcrumb/page-title row below it.
  static const double navToBreadcrumbGap = 14;

  /// Space between the breadcrumb/page-title row and the main page content (list, form, table).
  static const double breadcrumbToContentGap = 8;
  // space btw right and left columns in rows
  static const double spaceBtwRwCl = 30;

  // Screen padding
  static const EdgeInsets mobilePadding = EdgeInsets.all(16);

  static const EdgeInsets tabletPadding = EdgeInsets.all(20);

  static const EdgeInsets desktopPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 8,
  );

  // Common padding
  static const EdgeInsets containerPadding = EdgeInsets.all(16);

  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(
    horizontal: 16,
  );

  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 16);


  // container list section padding
  static const EdgeInsets listTableRowPadding =  EdgeInsets.symmetric(horizontal: 12, vertical: 10);

  // container padding horizental + vertical
  static const EdgeInsets bigContainer = EdgeInsets.symmetric(
    vertical: 24,
    horizontal: 24,
  );
}
