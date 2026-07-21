import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/features/general_ledger/widget/general_ledger_totall_row.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';

class GeneralLedgerHomeScreen extends StatefulWidget {
  const GeneralLedgerHomeScreen({super.key});

  @override
  State<GeneralLedgerHomeScreen> createState() =>
      _GeneralLedgerHomeScreenState();
}

class _GeneralLedgerHomeScreenState extends State<GeneralLedgerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isDesktop = width >= ScreenBreakPoints.desktop;
        final isTablet =
            width >= ScreenBreakPoints.mobile &&
            width < ScreenBreakPoints.desktop;

        if (isDesktop) {
          return _desktopLayout();
        } else if (isTablet) {
          return _tabletLayout();
        }

        return _mobileLayout();
      },
    );
  }

  Widget _desktopLayout() {
    return Scaffold(
      backgroundColor: APPColors.bodyBackgroundColor,
      body: Column(
        children: [
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                children: [
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),
                  BreadcrumbBar(
                    title: "General Ledger",
                    actions: [
                      CustomButton(
                        title: "PDF",
                        onPressed: () {},
                        backgroundColor: APPColors.btnPurple,
                        padding: AppButtons.btnPaddingSymm,
                        textColor: APPColors.white,
                      ),
                      SizedBox(width: AppSpacing.xs),
                      CustomButton(
                        title: "XLXS",
                        onPressed: () {},
                        backgroundColor: APPColors.btnGrey,
                        padding: AppButtons.btnPaddingSymm,
                        textColor: APPColors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.breadcrumbToContentGap),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: APPColors.navBackgroundColor,
                  border: Border.all(color: APPColors.contentBorderColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const GeneralLedgerTotalRow(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabletLayout() {
    return Scaffold(
      backgroundColor: APPColors.bodyBackgroundColor,
      body: Column(
        children: [
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: AppSpacing.tabletPadding,
              child: Column(
                children: [
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),
                  BreadcrumbBar(
                    title: "General Ledger",
                    actions: [
                      CustomButton(
                        title: "PDF",
                        onPressed: () {},
                        backgroundColor: APPColors.btnPurple,
                        padding: AppButtons.btnPaddingSymm,
                        textColor: APPColors.white,
                      ),
                      SizedBox(width: AppSpacing.xs),
                      CustomButton(
                        title: "XLXS",
                        onPressed: () {},
                        backgroundColor: APPColors.btnGrey,
                        padding: AppButtons.btnPaddingSymm,
                        textColor: APPColors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.breadcrumbToContentGap),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: APPColors.navBackgroundColor,
                  border: Border.all(color: APPColors.contentBorderColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const GeneralLedgerTotalRow(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mobileLayout() {
    return Scaffold(
      backgroundColor: APPColors.bodyBackgroundColor,
      body: Column(
        children: [
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: AppSpacing.mobilePadding,
              child: Column(
                children: [
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),
                  BreadcrumbBar(
                    title: "General Ledger",
                    actions: [
                      CustomButton(
                        title: "PDF",
                        onPressed: () {},
                        backgroundColor: APPColors.btnPurple,
                        padding: AppButtons.btnPaddingSymm,
                        textColor: APPColors.white,
                      ),
                      SizedBox(width: AppSpacing.xs),
                      CustomButton(
                        title: "XLXS",
                        onPressed: () {},
                        backgroundColor: APPColors.btnGrey,
                        padding: AppButtons.btnPaddingSymm,
                        textColor: APPColors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.breadcrumbToContentGap),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: APPColors.navBackgroundColor,
                  border: Border.all(color: APPColors.contentBorderColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const GeneralLedgerTotalRow(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
