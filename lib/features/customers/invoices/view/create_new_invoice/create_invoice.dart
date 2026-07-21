import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/comm/widgets/app_footer.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/comm/widgets/second_footer.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/widget/customer_invoice.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/widget/action_bar.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';

class CreateInvoice extends StatefulWidget {
  const CreateInvoice({super.key});

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}

class _CreateInvoiceState extends State<CreateInvoice> {
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
                children: [
                  // ACCOUNTING NAVBAR
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),

                  // NAVBAR/ Header
                  BreadcrumbBar(
                    title: "Invoices",
                    actions: [
                      CustomButton(
                        title: "New",
                        padding: AppButtons.btnPaddingSymm,
                      ),
                      CustomButton(title: "invoice", textColor: Colors.green),
                    ],
                    icon: Icons.settings,
                  ),
                ], // 2nd Row
              ),
            ),
          ),
          Divider(height: 1,),
          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2nd  confirm + draft button
                    ActionBar(),
                    SizedBox(height: AppSpacing.sm,),
                    // Customer Invoice section
                    CustomerInvoice(),
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
                children: [
                  // ACCOUNTING NAVBAR
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),

                  // NAVBAR/ Header
                  BreadcrumbBar(
                    title: "Invoices",
                    actions: [
                      CustomButton(
                        title: "New",
                        padding: AppButtons.btnPaddingSymm,
                      ),
                      CustomButton(title: "invoice", textColor: Colors.green),
                    ],
                    icon: Icons.settings,
                  ),
                ], // 2nd Row
              ),
            ),
          ),
          Divider(height: 1,),
          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2nd  confirm + draft button
                    ActionBar(),
                    SizedBox(height: AppSpacing.sm,),
                    // Customer Invoice section
                    CustomerInvoice(),
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
                children: [
                  // ACCOUNTING NAVBAR
                  HomeNavBar(),
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),

                  // NAVBAR/ Header
                  BreadcrumbBar(
                    title: "Invoices",
                    actions: [
                      CustomButton(
                        title: "New",
                        padding: AppButtons.btnPaddingSymm,
                      ),
                      CustomButton(title: "invoice", textColor: Colors.green),
                    ],
                    icon: Icons.settings,
                  ),
                ], // 2nd Row
              ),
            ),
          ),
          Divider(height: 1,),
          Expanded(
            child: Padding(
              padding: AppSpacing.desktopPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2nd  confirm + draft button
                    ActionBar(),
                    SizedBox(height: AppSpacing.sm,),
                    // Customer Invoice section
                    CustomerInvoice(),
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
