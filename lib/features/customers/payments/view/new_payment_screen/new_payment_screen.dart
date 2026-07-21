import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/comm/widgets/app_footer.dart';
import 'package:flutter_odoo/comm/widgets/custom_container.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/comm/widgets/second_footer.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/widget/action_bar_payment.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/widget/payment_add_field.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';

class NewPaymentHomeScreen extends StatelessWidget {
  const NewPaymentHomeScreen({super.key});

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
              padding: AppSpacing.desktopPadding,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ACCOUNTING NAVBAR
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.md),

                  BreadcrumbBar(
                    title: "Draft Payment",
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

                  SizedBox(height: AppSpacing.spaceBtwInputFields),
                ], // 2nd Row
              ),
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ActionBarPayment(),

                    SizedBox(height: AppSpacing.spaceBtwInputFields),

                    PaymentAddField(),
                    SizedBox(height: AppSpacing.lg),
                    // send message + log note + activity
                    SecondFooter(),
                    SizedBox(height: AppSpacing.lg),

                    // footer
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

      //navigation
      body: Column(
        children: [
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: AppSpacing.desktopPadding,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ACCOUNTING NAVBAR
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.md),

                  BreadcrumbBar(
                    title: "Draft Payment",
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

                  SizedBox(height: AppSpacing.spaceBtwInputFields),
                ], // 2nd Row
              ),
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ActionBarPayment(),

                    SizedBox(height: AppSpacing.spaceBtwInputFields),

                    PaymentAddField(),
                    SizedBox(height: AppSpacing.lg),
                    // send message + log note + activity
                    SecondFooter(),
                    SizedBox(height: AppSpacing.lg),

                    // footer
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

      //navigation
      body: Column(
        children: [
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: AppSpacing.desktopPadding,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ACCOUNTING NAVBAR
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.md),

                  BreadcrumbBar(
                    title: "Draft Payment",
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

                  SizedBox(height: AppSpacing.spaceBtwInputFields),
                ], // 2nd Row
              ),
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ActionBarPayment(),

                    SizedBox(height: AppSpacing.spaceBtwInputFields),

                    PaymentAddField(),
                    SizedBox(height: AppSpacing.lg),
                    // send message + log note + activity
                    SecondFooter(),
                    SizedBox(height: AppSpacing.lg),

                    // footer
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
