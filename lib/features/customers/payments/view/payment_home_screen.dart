import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/features/customers/payments/widget/payment_list_section.dart';
import 'package:flutter_odoo/routes/routes_name.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PaymentHomeScreen extends StatefulWidget {
  const PaymentHomeScreen({super.key});

  @override
  State<PaymentHomeScreen> createState() => _PaymentHomeScreenState();
}

class _PaymentHomeScreenState extends State<PaymentHomeScreen> {
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
              padding: AppSpacing.desktopPadding,
              child: Column(
                children: [
                  // ACCOUNTING NAVBAR
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.md),

                  // NAVBAR
                  BreadcrumbBar(
                    title: "Customer Payments",
                    actions: [
                      CustomButton(
                        title: "New",
                        onPressed: () {
                          Get.toNamed(RoutesName.newPayment);
                        },
                        backgroundColor: APPColors.btnPurple,
                        padding: AppButtons.btnPaddingSymm,
                        textColor: APPColors.white,
                      ),
                    ],
                  ),

                  SizedBox(height: AppSpacing.spaceBtwInputFields),
                ],
              ),
            ),
          ),

          Divider(height: 1,),
          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: PaymentListSection(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabletLayout() {
    return Scaffold(
      backgroundColor: APPColors.white,
      //navigation
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            // ACCOUNTING NAVBAR
            HomeNavBar(),
            SizedBox(height: AppSpacing.md),

            // NAVBAR
            BreadcrumbBar(
              title: "Customer Payments",
              actions: [
                CustomButton(
                  title: "New",
                  onPressed: () {
                    Get.toNamed(RoutesName.newPayment);
                  },
                  backgroundColor: APPColors.btnPurple,
                  padding: AppButtons.btnPaddingSymm,
                  textColor: APPColors.white,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.spaceBtwInputFields),
            Divider(),
            Expanded(child: PaymentListSection()),
          ],
        ),
      ),
    );
  }

  Widget _mobileLayout() {
    return Scaffold(
      backgroundColor: APPColors.white,
      //navigation
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            // ACCOUNTING NAVBAR
            HomeNavBar(),
            SizedBox(height: AppSpacing.md),

            // NAVBAR
            BreadcrumbBar(
              title: "Customer Payments",
              actions: [
                CustomButton(
                  title: "New",
                  onPressed: () {
                    Get.toNamed(RoutesName.newPayment);
                  },
                  backgroundColor: APPColors.btnPurple,
                  padding: AppButtons.btnPaddingSymm,
                  textColor: APPColors.white,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.spaceBtwInputFields),
            Divider(),
            Expanded(child: PaymentListSection()),
          ],
        ),
      ),
    );
  }
}
