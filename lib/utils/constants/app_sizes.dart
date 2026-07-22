import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/responsiveness/responsiveness_value.dart';

class AppSizes {
  AppSizes._();

  // ============================================================
  // SPACING — general padding/margin scale
  // ============================================================
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;

  // ============================================================
  // ICON SIZES
  // ============================================================
  static const double iconXs = 14.0; // small inline icons (tooltip "?" etc.)
  static const double iconSm = 16.0; // suffix/prefix icons in form fields
  static const double iconMd =
      20.0; // nav bar action icons (settings, message, clock)
  static const double iconLg = 24.0; // primary action icons

  // ============================================================
  // FONT SIZES
  // ============================================================
  static const double fontSizeXs = 12.0; // header column labels, tags
  static const double fontSizeSm = 13.0; // table cell text, secondary labels
  static const double fontSizeMd = 14.0; // body text, form field text
  static const double fontSizeLg =
      16.0; // section headers (ASSET VALUES, CURRENT VALUES)
  static const double fontSizeXl =
      20.0; // page title (Chart of Accounts, Assets)
  static const double fontSizeXxl =
      28.0; // large placeholder heading (e.g. Laptop iBook hint)

  // ============================================================
  // NAV BAR
  // ============================================================
  static const double navBarHeight = 56.0;
  static const double navToBreadcrumbGap = 8.0;
  static const double breadcrumbToContentGap = 4.0;

  // ============================================================
  // BUTTON SIZES
  // ============================================================
  static const double buttonHeightSm =
      32.0; // small toolbar buttons (Confirm, Compute Depreciation)
  static const double buttonHeightMd =
      40.0; // standard action buttons (New, Post)
  static const EdgeInsets buttonPaddingSm = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 6,
  );
  static const EdgeInsets buttonPaddingMd = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 10,
  );
  static const double buttonRadius = 4.0;

  // ============================================================
  // FORM FIELD / LABEL LAYOUT
  // ============================================================
  static const double formLabelWidth =
      130.0; // fixed label column width (Asset Name, Date, etc.)
  static const double formLabelWidthSm =
      90.0; // shorter label column (used for compact rows)
  static const double formFieldSpacing = 8.0; // gap between label and field
  static const double formRowSpacing = 12.0; // vertical gap between form rows
  static const double formSectionSpacing =
      24.0; // gap between form sections (ASSET VALUES vs CURRENT VALUES)
  static const EdgeInsets formFieldPadding = EdgeInsets.symmetric(vertical: 8);

  // ============================================================
  // TABLE / LIST VIEW (Chart of Accounts style)
  // ============================================================
  static const double tableRowHeight =
      48.0; // fixed row height — every row same height regardless of content
  static const double tableHeaderHeight = 44.0;
  static const EdgeInsets tableRowPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 10,
  );
  static const double tableCheckboxColumnWidth =
      40.0; // reserved space for row checkbox
  static const double tableBorderWidth = 1.0;

  // ============================================================
  // TAB BAR (Asset / Bills tabs)
  // ============================================================
  static const double tabBarHeight = 44.0;
  static const EdgeInsets tabPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );
  static const double tabIndicatorWidth = 3.0;

  // ============================================================
  // SWITCH / TOGGLE (Payment Reconciliation column)
  // ============================================================
  static const double switchScale = 0.8;

  // ============================================================
  // CONTENT CONTAINER (the bordered white card wrapping forms/tables)
  // ============================================================
  static const EdgeInsets contentContainerPadding = EdgeInsets.all(20);
  static const double contentContainerRadius = 4.0;
  static const double contentContainerBorderWidth = 1.0;
  static const EdgeInsets contentOuterMargin = EdgeInsets.all(
    24,
  ); // gap between container and grey page background

  // ============================================================
  // SIDEBAR / SECTION DIVIDERS
  // ============================================================
  static const double sectionHeaderSpacing =
      6.0; // gap between section title and its divider
  static const double sectionContentSpacing =
      16.0; // gap after divider before first field

  //    // ============================================================
  //   //SCREEN PADDING —
  //   // ============================================================

  static EdgeInsets screenPadding(BuildContext context) {
    return ResponsiveValue<EdgeInsets>(
      mobile: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      tablet: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      desktop: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    ).resolve(context);
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_odoo/utils/constants/responsiveness/responsiveness.dart';

// class AppSizes {
//   AppSizes._();

//   // ============================================================
//   // SPACING — stays FIXED. xs/sm/md/lg is a relative scale;
//   // the RATIO between them matters more than absolute values,
//   // and this scale already feels fine at any screen size.
//   // ============================================================
//   static const double xxs = 2.0;
//   static const double xs = 4.0;
//   static const double sm = 8.0;
//   static const double md = 16.0;
//   static const double lg = 24.0;
//   static const double xl = 32.0;
//   static const double xxl = 40.0;

//   // ============================================================
//   // ICON SIZES — stays FIXED. Icons don't need to shrink on mobile;
//   // if anything mobile icons often stay same/slightly bigger for touch targets.
//   // ============================================================
//   static const double iconXs = 14.0;
//   static const double iconSm = 16.0;
//   static const double iconMd = 20.0;
//   static const double iconLg = 24.0;

//   // ============================================================
//   // FONT SIZES — MOSTLY fixed, but page titles benefit from responsiveness
//   // (a 28px heading can feel oversized on a narrow phone screen)
//   // ============================================================
//   static const double fontSizeXs = 12.0;
//   static const double fontSizeSm = 13.0;
//   static const double fontSizeMd = 14.0;
//   static const double fontSizeLg = 16.0;

//   // ✅ responsive — page titles scale down on mobile
//   static double fontSizeXl(BuildContext context) {
//     return ResponsiveValue<double>(mobile: 18, tablet: 19, desktop: 20).resolve(context);
//   }

//   static double fontSizeXxl(BuildContext context) {
//     return ResponsiveValue<double>(mobile: 22, tablet: 25, desktop: 28).resolve(context);
//   }

//   // ============================================================
//   // NAV BAR — stays FIXED height, but gaps can tighten on mobile
//   // ============================================================
//   static const double navBarHeight = 56.0;

//   static double navToBreadcrumbGap(BuildContext context) {
//     return ResponsiveValue<double>(mobile: 4, desktop: 8).resolve(context);
//   }

//   static double breadcrumbToContentGap(BuildContext context) {
//     return ResponsiveValue<double>(mobile: 8, desktop: 16).resolve(context);
//   }

//   // ============================================================
//   // BUTTON SIZES — stays FIXED. Buttons should have a consistent,
//   // comfortable tap target regardless of device — shrinking them
//   // on mobile actually hurts usability (fingers vs. mouse cursor).
//   // ============================================================
//   static const double buttonHeightSm = 32.0;
//   static const double buttonHeightMd = 40.0;
//   static const EdgeInsets buttonPaddingSm = EdgeInsets.symmetric(horizontal: 12, vertical: 6);
//   static const EdgeInsets buttonPaddingMd = EdgeInsets.symmetric(horizontal: 16, vertical: 10);
//   static const double buttonRadius = 4.0;

//   // ============================================================
//   // FORM FIELD / LABEL LAYOUT — HIGHLY responsive.
//   // This is the #1 thing that actually needs to change on mobile —
//   // narrow labels, or consider switching Row→Column at the widget level instead.
//   // ============================================================
//   static double formLabelWidth(BuildContext context) {
//     return ResponsiveValue<double>(mobile: 80, tablet: 110, desktop: 130).resolve(context);
//   }

//   static double formLabelWidthSm(BuildContext context) {
//     return ResponsiveValue<double>(mobile: 70, desktop: 90).resolve(context);
//   }

//   static const double formFieldSpacing = 8.0; // fixed — small gap, no need to scale
//   static const double formRowSpacing = 12.0;  // fixed
//   static const double formSectionSpacing = 24.0; // fixed
//   static const EdgeInsets formFieldPadding = EdgeInsets.symmetric(vertical: 8);

//   // ============================================================
//   // TABLE / LIST VIEW — row height fixed (touch target consistency),
//   // but horizontal padding benefits from tightening on mobile
//   // ============================================================
//   static const double tableRowHeight = 48.0;
//   static const double tableHeaderHeight = 44.0;

//   static EdgeInsets tableRowPadding(BuildContext context) {
//     return ResponsiveValue<EdgeInsets>(
//       mobile: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//       desktop: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//     ).resolve(context);
//   }

//   static const double tableCheckboxColumnWidth = 40.0;
//   static const double tableBorderWidth = 1.0;

//   // ============================================================
//   // TAB BAR — stays FIXED
//   // ============================================================
//   static const double tabBarHeight = 44.0;
//   static const EdgeInsets tabPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
//   static const double tabIndicatorWidth = 3.0;

//   // ============================================================
//   // SWITCH — stays FIXED
//   // ============================================================
//   static const double switchScale = 0.8;

//   // ============================================================
//   // CONTENT CONTAINER — responsive padding/margin.
//   // Mobile has much less width to spare, so a 24px outer margin
//   // + 20px inner padding eats too much of a phone's screen.
//   // ============================================================
//   static EdgeInsets contentContainerPadding(BuildContext context) {
//     return ResponsiveValue<EdgeInsets>(
//       mobile: const EdgeInsets.all(12),
//       tablet: const EdgeInsets.all(16),
//       desktop: const EdgeInsets.all(20),
//     ).resolve(context);
//   }

//   static const double contentContainerRadius = 4.0;
//   static const double contentContainerBorderWidth = 1.0;

//   static EdgeInsets contentOuterMargin(BuildContext context) {
//     return ResponsiveValue<EdgeInsets>(
//       mobile: const EdgeInsets.all(8),
//       tablet: const EdgeInsets.all(16),
//       desktop: const EdgeInsets.all(24),
//     ).resolve(context);
//   }

//   // ============================================================
//   // SIDEBAR / SECTION DIVIDERS — stays FIXED
//   // ============================================================
//   static const double sectionHeaderSpacing = 6.0;
//   static const double sectionContentSpacing = 16.0;


//    // ============================================================
//   //SCREEN PADDING — 
//   // ============================================================

//   static EdgeInsets screenPadding(BuildContext context) {
//   return ResponsiveValue<EdgeInsets>(
//     mobile: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//     tablet: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     desktop: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//   ).resolve(context);
// }
// }