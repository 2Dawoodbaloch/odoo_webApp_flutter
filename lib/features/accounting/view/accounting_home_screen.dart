import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/accounting_dashboard.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';

enum MenuOptions { profile, settings, logout }

class AccountingHomeScreen extends StatefulWidget {
  const AccountingHomeScreen({super.key});

  @override
  State<AccountingHomeScreen> createState() => _AccountingHomeScreenState();
}

class _AccountingHomeScreenState extends State<AccountingHomeScreen> {
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

  // Desktop Layout
  Widget _desktopLayout() {
    return Scaffold(
      backgroundColor: APPColors.bodyBackgroundColor,

      //navigation
      body: Column(
        children: [
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),

              child: Column(
                children: [
                  // ACCOUNTING NAVBAR
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.md),
                  // NAVBAR
                  BreadcrumbBar(title: "Accounting"),
                  SizedBox(height: AppSpacing.spaceBtwInputFields),

                  // Card Screen

                  // Row first
                ], // 2nd Row
              ),
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(children: [AccountingDashBoard()]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TABLET LAYOUT
  Widget _tabletLayout() {
    return Column(children: []);
  }

  // MOBILE LAYOUT
  Widget _mobileLayout() {
    return Column(children: []);
  }
}
