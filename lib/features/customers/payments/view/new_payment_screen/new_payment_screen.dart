import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/comm/widgets/app_footer.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/comm/widgets/second_footer.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/widget/action_bar_payment.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/widget/payment_add_field.dart';
import 'package:flutter_odoo/routes/routes_name.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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
      backgroundColor: APPColors.white,

      //navigation
      body: Padding(
        padding: AppSpacing.desktopPadding,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ACCOUNTING NAVBAR
            HomeNavBar(),
            SizedBox(height: AppSpacing.md),

            // NAVBAR/ Header
            BreadcrumbBar(
              title: "Customer Payments",
              actions: [
                CustomButton(
                  title: "New",
                  onPressed: () {
                    Get.toNamed(RoutesName.createInvoices);
                  },
                  backgroundColor: APPColors.btnPurple,
                  padding: AppButtonSize.btnPaddingSymm,
                  textColor: APPColors.white,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.sm),
            Divider(),
            SizedBox(height: AppSpacing.xxs),

            // 2nd  confirm + draft button
            ActionBarPayment(),

            SizedBox(height: AppSpacing.sm),

            PaymentAddField(),
            SizedBox(height: AppSpacing.lg),
            // send message + log note + activity
            SecondFooter(),
            SizedBox(height: AppSpacing.lg),

            // footer
            AppFooter(),
          ], // 2nd Row
        ),
      ),
    );
  }

  Widget _tabletLayout() {
    return Scaffold();
  }

  Widget _mobileLayout() {
    return Scaffold();
  }
}
