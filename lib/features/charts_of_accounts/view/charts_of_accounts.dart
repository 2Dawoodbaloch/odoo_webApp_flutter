import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/breadcrumb_right_section.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/features/charts_of_accounts/widget/charts_list_section.dart';
import 'package:flutter_odoo/routes/routes_name.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:get/get.dart';

class ChartsOfAccounts extends StatefulWidget {
  const ChartsOfAccounts({super.key});

  @override
  State<ChartsOfAccounts> createState() => _ChartsOfAccountsState();
}

class _ChartsOfAccountsState extends State<ChartsOfAccounts> {
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
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),

                  // Breadcumbbar
                  BreadcrumbBar(
                    title: "Charts of Account",
                    icon: Icons.settings,
                    leftActions: [
                      CustomButton(title: "New", onPressed: () {}),
                      CustomButton(title: "Upload", onPressed: () {}),
                    ],
                    showSearchBar: true,
                    rightSection: const BreadcrumbRightSection(),
                  ),
                  SizedBox(height: AppSpacing.breadcrumbToContentGap),
                ],
              ),
            ),
          ),

          Expanded(child: ChartsListSection()),
        ],
      ),
    );
  }

  Widget _tabletLayout() {
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
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),

                  // NAVBAR
                  // Breadcumbbar
                  BreadcrumbBar(
                    title: "Charts of Account",
                    icon: Icons.settings,
                    leftActions: [
                      CustomButton(title: "New", onPressed: () => Get.toNamed(RoutesName.createChartsAccounts)),
                      CustomButton(title: "Upload", onPressed: () {}),
                    ],
                    showSearchBar: true,
                    rightSection: const BreadcrumbRightSection(),
                  ),
                  SizedBox(height: AppSpacing.breadcrumbToContentGap),
                ],
              ),
            ),
          ),

          Expanded(child: ChartsListSection()),
        ],
      ),
    );
  }

  Widget _mobileLayout() {
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
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),

                  // Breadcumbbar
                  BreadcrumbBar(
                    title: "Charts of Account",
                    icon: Icons.settings,
                    leftActions: [
                      CustomButton(title: "New", onPressed: () {}),
                      CustomButton(title: "Upload", onPressed: () {}),
                    ],
                    showSearchBar: true,
                    rightSection: const BreadcrumbRightSection(),
                  ),
                  SizedBox(height: AppSpacing.breadcrumbToContentGap),
                ],
              ),
            ),
          ),

          Expanded(child: ChartsListSection()),
        ],
      ),
    );
  }
}
