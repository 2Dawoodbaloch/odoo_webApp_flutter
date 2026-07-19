import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/widgets/journal_list_section.dart';
import 'package:flutter_odoo/routes/routes_name.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:get/route_manager.dart';

class JournalEntriesHome extends StatefulWidget {
  const JournalEntriesHome({super.key});

  @override
  State<JournalEntriesHome> createState() => _JournalEntriesHomeState();
}

class _JournalEntriesHomeState extends State<JournalEntriesHome> {
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
              padding: AppSpacing.desktopPadding,
              child: Column(
                children: [
                  //top nav bar
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.spaceBtwInputFields),

                  // HEADER
                  BreadcrumbBar(
                    title: "Journal Entries",
                    actions: [
                      CustomButton(
                        title: "New",
                        backgroundColor: APPColors.btnPurple,
                        textColor: APPColors.white,
                        padding: AppButtons.btnPaddingSymm,
                        onPressed: () =>
                            Get.toNamed(RoutesName.createJournalEntries),
                      ),
                    ],
                    icon: Icons.settings,
                  ),

                  SizedBox(height: AppSpacing.xs),
                ],
              ),
            ),
          ),
          Divider(height: 1),

          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: JournalListSection(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabletLayout() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: AppSpacing.desktopPadding,
        child: Column(
          children: [
            //top nav bar
            HomeNavBar(),
            SizedBox(height: AppSpacing.spaceBtwInputFields),

            // HEADER
            BreadcrumbBar(
              title: "Journal Entries",
              actions: [
                CustomButton(
                  title: "New",
                  backgroundColor: APPColors.btnPurple,
                  textColor: APPColors.white,
                  padding: AppButtons.btnPaddingSymm,
                  onPressed: () => Get.toNamed(RoutesName.createJournalEntries),
                ),
              ],
              icon: Icons.settings,
            ),

            SizedBox(height: AppSpacing.xs),

            Divider(),

            Expanded(child: JournalListSection()),
          ],
        ),
      ),
    );
  }

  Widget _mobileLayout() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: AppSpacing.desktopPadding,
        child: Column(
          children: [
            //top nav bar
            HomeNavBar(),
            SizedBox(height: AppSpacing.spaceBtwInputFields),

            // HEADER
            BreadcrumbBar(
              title: "Journal Entries",
              actions: [
                CustomButton(
                  title: "New",
                  backgroundColor: APPColors.btnPurple,
                  textColor: APPColors.white,
                  padding: AppButtons.btnPaddingSymm,
                  onPressed: () => Get.toNamed(RoutesName.createJournalEntries),
                ),
              ],
              icon: Icons.settings,
            ),

            SizedBox(height: AppSpacing.xs),

            Divider(),

            Expanded(child: JournalListSection()),
          ],
        ),
      ),
    );
  }
}
