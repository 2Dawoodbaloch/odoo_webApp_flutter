import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/features/customers/invoices/widget/invoice_list_section.dart';
import 'package:flutter_odoo/routes/routes_name.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class CustomersInvoices extends StatefulWidget {
  const CustomersInvoices({super.key});

  @override
  State<CustomersInvoices> createState() => _CustomersInvoicesState();
}

class _CustomersInvoicesState extends State<CustomersInvoices> {
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
                  SizedBox(height: AppSpacing.navToBreadcrumbGap),

                  // NAVBAR
                  BreadcrumbBar(
                    title: "Invoices",
                    icon: Icons.settings,
                    actions: [
                      CustomButton(
                        title: "New",
                        onPressed: () {
                          Get.toNamed(RoutesName.createInvoices);
                        },
                        backgroundColor: APPColors.btnPurple,
                        padding: AppButtons.btnPaddingSymm,
                        textColor: APPColors.white,
                      ),
                      const SizedBox(width: 8),
                      CustomButton(
                        title: "Upload",
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
          Expanded(child: InvoiceListSection()),
        ],
      ),
    );
  }
}

Widget _mobileLayout() {
  return Container();
}

Widget _tabletLayout() {
  return Container();
}
