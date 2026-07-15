import 'package:flutter/material.dart';

class APPColors {
  APPColors._();

  //button color
  static const Color btnGrey = Color(0xFFD8DADD);
  static const Color btnPurple = Color(0xFF52374B);
  static const Color btnMango = Color(0xFFF8D6C8);
  static const Color btnSky = Color(0xFFBBD7F8);
  

  // ----- Primary Brand Colors -----
  static const Color primary = Color(0xFF714B67);
  static const Color primaryLight = Color(0xFFE8F0FE);
  static const Color primaryDark = Color(0xFF063B6E);

  // ----- Text Colors -----
  static const Color txtBlack = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textLight = Color(0xFF9E9E9E);
 static const Color hintText = Color(0xFF9E9E9E);
  static const Color textWhite = Colors.white;

  // 

  // ----- Background Colors -----
  static const Color cardBackgroundColor = Color(0xD8DADD);
  static const Color backgroundLight = Color(0xF3F4F6);
  static const Color backgroundCard = Color(0xFFFFFFFF);
  static const Color sidebarBackground = Color(0xFF1E2A3A); // Dark sidebar
  static const Color sidebarHover = Color(0xFF2A3A4E);

  // ----- Button Colors -----
  static const Color buttonPrimary = Color(0xFF0857A0);
  static const Color buttonPrimaryHover = Color(0xFF063B6E);
  static const Color buttonDisabled = Color(0xFFC4C4C4);
  static const Color buttonNew = Color(0xFF0857A0);

  // ----- Border & Divider Colors -----
  static const Color borderPrimary = Color(0xFFE0E0E0);
  static const Color borderSecondary = Color(0xFFF0F0F0);
  static const Color divider = Color(0xFFEEEEEE);

  // ----- Status / Tag Colors -----
  static const Color statusActive = Color(0xFF4CAF50);   // Green
  static const Color statusPending = Color(0xFFFF9800); // Orange
  static const Color statusDemo = Color(0xFF9E9E9E);    // Grey
  static const Color statusInactive = Color(0xFFF44336); // Red

  // ----- Feedback Colors -----
  static const Color success = Color(0xFF388E3C);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // ----- Neutral Shades -----
  static const Color black = Color(0xFF1A1A1A);
  static const Color darkGrey = Color(0xFF6C757D);
  static const Color grey = Color(0xFFBDBDBD);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);

  // ----- Shadow -----
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);

  // ----- Helper method to get status color -----
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
      case 'employee':
        return statusActive;
      case 'pending':
      case 'pending activation':
        return statusPending;
      case 'demo':
      case 'consultant':
        return statusDemo;
      case 'inactive':
        return statusInactive;
      default:
        return grey;
    }
  }
}