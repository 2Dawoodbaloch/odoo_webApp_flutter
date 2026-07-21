import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/responsiveness/responsiveness.dart';

extension ResponsiveContext on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get width => screenSize.width;

  double get height => screenSize.height;

  bool get isMobile => Responsive.isMobile(this);

  bool get isTablet => Responsive.isTablet(this);

  bool get isDesktop => Responsive.isDesktop(this);

  AppScreenType get screenType => Responsive.screenTypeOf(this);
}