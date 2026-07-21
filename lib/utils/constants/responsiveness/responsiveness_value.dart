import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/responsiveness/responsiveness.dart';

class ResponsiveValue<T> {
  const ResponsiveValue({required this.mobile, this.tablet, required this.desktop});

  final T mobile;
  final T? tablet;
  final T desktop;

  T resolve(BuildContext context) {
    switch (Responsive.screenTypeOf(context)) {
      case AppScreenType.desktop:
        return desktop;
      case AppScreenType.tablet:
        return tablet ?? mobile;
      case AppScreenType.mobile:
        return mobile;
    }
  }
}