import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/comm/widgets/app_footer.dart';
import 'package:flutter_odoo/comm/widgets/custom_container.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/comm/widgets/second_footer.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/widget/breadcrumber_breadcrumber.dart';
import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/widget/chartsof_account_formfields.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CreateChartsOfAccount extends StatelessWidget {
  const CreateChartsOfAccount({super.key});

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
      body: Column(
        children: [
          // ✅ White zone: nav + breadcrumb + their surrounding padding
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: Column(
                children: [
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),
                 BreadcrumbBar(
                    title: "Draft Invoice",
                    icon: Icons.settings,
                    leftActions: [],
                    showSearchBar: false,
                    rightSection: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomContainer(
                          icon: Icons.cloud_upload_outlined,
                          color: APPColors.btnGrey /* ... */,
                        ),
                        const SizedBox(width: 4),
                        CustomContainer(
                          icon: Icons.close,
                          color: APPColors.btnGrey /* ... */,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 1),

          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSpacing.breadcrumbToContentGap),
                    ChartsOfAccountsFormFields(),
                    SizedBox(height: AppSpacing.lg),
                    SecondFooter(),
                    SizedBox(height: AppSpacing.lg),
                    AppFooter(),
                  ],
                ),
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
          // ✅ White zone: nav + breadcrumb + their surrounding padding
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: Column(
                children: [
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),
                  BreadcrumbBar(
                    title: "Draft Invoice",
                    icon: Icons.settings,
                    leftActions: [],
                    showSearchBar: false,
                    rightSection: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomContainer(
                          icon: Icons.cloud_upload_outlined,
                          color: APPColors.btnGrey /* ... */,
                        ),
                        const SizedBox(width: 4),
                        CustomContainer(
                          icon: Icons.close,
                          color: APPColors.btnGrey /* ... */,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 1),

          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSpacing.breadcrumbToContentGap),
                    ChartsOfAccountsFormFields(),
                    SizedBox(height: AppSpacing.lg),
                    SecondFooter(),
                    SizedBox(height: AppSpacing.lg),
                    AppFooter(),
                  ],
                ),
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
          // ✅ White zone: nav + breadcrumb + their surrounding padding
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: Column(
                children: [
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),
                  BreadcrumbBar(
                    title: "Chart of Account",
                    icon: Icons.settings,
                    leftActions: [],
                    showSearchBar: false,
                    rightSection: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomContainer(
                          icon: Icons.cloud_upload_outlined,
                          color: APPColors.btnGrey /* ... */,
                        ),
                        const SizedBox(width: 4),
                        CustomContainer(
                          icon: Icons.close,
                          color: APPColors.btnGrey /* ... */,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 1),

          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSpacing.breadcrumbToContentGap),
                    ChartsOfAccountsFormFields(),
                    SizedBox(height: AppSpacing.lg),
                    SecondFooter(),
                    SizedBox(height: AppSpacing.lg),
                    AppFooter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
