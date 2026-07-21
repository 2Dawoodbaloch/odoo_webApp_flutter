import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/breadcrumb_right_section.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/searchbar_field.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/home_navbar.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/widget/app_nav_drawer.dart';
import 'package:flutter_odoo/features/customers/invoices/widget/invoice_list_section.dart';
import 'package:flutter_odoo/routes/routes_name.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_sizes.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/responsiveness/responsiveness.dart';
import 'package:flutter_odoo/utils/constants/responsiveness/responsiveness_extention.dart';
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
    return Scaffold(
      backgroundColor: APPColors.bodyBackgroundColor,
      drawer: Responsive.screenTypeOf(context) == AppScreenType.mobile
          ? const AppNavDrawer()
          : null,
      body: Column(
        children: [
          Container(
            color: APPColors.navBackgroundColor,
            child: Padding(
              padding: AppSizes.screenPadding(context),
              child: Column(
                children: [
                  const HomeNavBar(), // ✅ handles its OWN internal responsiveness
                  SizedBox(height: AppSizes.navToBreadcrumbGap),
                  BreadcrumbBar(
                    title: "Invoices",
                    icon: Icons.settings,
                    leftActions: [
                      CustomButton(
                        title: "New",
                        backgroundColor: APPColors.btnPurple,
                        textColor: APPColors.white,
                        padding: AppSizes.buttonPaddingSm,
                        onPressed: () => Get.toNamed(RoutesName.createInvoices),
                      ),
                      SizedBox(width: AppSizes.xs),
                      CustomButton(
                        title: "Upload",
                        backgroundColor: APPColors.btnGrey,
                        textColor: APPColors.black,
                        padding: AppSizes.buttonPaddingSm,
                        onPressed: () {},
                      ),
                    ],
                    showSearchBar: context.isDesktop,
                    rightSection: const BreadcrumbRightSection(),
                  ),

                  if (!context.isDesktop)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSizes.md),
                      child: const SearchBarfield(width: double.infinity,),
                    ),
                  SizedBox(height: AppSizes.breadcrumbToContentGap),
                ],
              ),
            ),
          ),
          const Expanded(child: InvoiceListSection()),
        ],
      ),
    );
  }

  // Widget _desktopLayout() {
  //   return Scaffold(
  //     backgroundColor: APPColors.bodyBackgroundColor,
  //     //navigation
  //     body: Column(
  //       children: [
  //         Container(
  //           color: APPColors.navBackgroundColor,
  //           child: Padding(
  //             padding: AppSizes.screenPadding(context),
  //             child: Column(
  //               children: [
  //                 // ACCOUNTING NAVBAR
  //                 HomeNavBar(),
  //                 SizedBox(height: AppSizes.navToBreadcrumbGap),

  //                 // NAVBAR
  //                 BreadcrumbBar(
  //                   title: "Invoices",
  //                   icon: Icons.settings,
  //                   actions: [
  //                     CustomButton(
  //                       title: "New",
  //                       onPressed: () {
  //                         Get.toNamed(RoutesName.createInvoices);
  //                       },
  //                       backgroundColor: APPColors.btnPurple,
  //                       padding: AppButtons.btnPaddingSymm,
  //                       textColor: APPColors.white,
  //                     ),
  //                     const SizedBox(width: AppSizes.sm),
  //                     CustomButton(
  //                       title: "Upload",
  //                       onPressed: () {},
  //                       backgroundColor: APPColors.btnGrey,
  //                       padding: AppSizes.buttonPaddingSm,
  //                       textColor: APPColors.black,
  //                     ),
  //                   ],
  //                 ),

  //                 SizedBox(height: AppSizes.breadcrumbToContentGap),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Expanded(child: InvoiceListSection()),
  //       ],
  //     ),
  //   );
  // }

  // Widget _mobileLayout() {
  //   return Scaffold(
  //     backgroundColor: APPColors.bodyBackgroundColor,
  //     //navigation
  //     body: Column(
  //       children: [
  //         Container(
  //           color: APPColors.navBackgroundColor,
  //           child: Padding(
  //             padding: AppSizes.screenPadding(context),
  //             child: Column(
  //               children: [
  //                 // ACCOUNTING NAVBAR
  //                 HomeNavBar(),
  //                 SizedBox(height: AppSpacing.navToBreadcrumbGap),

  //                 // NAVBAR
  //                 BreadcrumbBar(
  //                   title: "Invoices",
  //                   icon: Icons.settings,
  //                   actions: [
  //                     CustomButton(
  //                       title: "New",
  //                       onPressed: () {
  //                         Get.toNamed(RoutesName.createInvoices);
  //                       },
  //                       backgroundColor: APPColors.btnPurple,
  //                       padding: AppButtons.btnPaddingSymm,
  //                       textColor: APPColors.white,
  //                     ),
  //                     const SizedBox(width: 8),
  //                     CustomButton(
  //                       title: "Upload",
  //                       onPressed: () {},
  //                       backgroundColor: APPColors.btnGrey,
  //                       padding: AppButtons.btnPaddingSymm,
  //                       textColor: APPColors.black,
  //                     ),
  //                   ],
  //                 ),

  //                 SizedBox(height: AppSpacing.breadcrumbToContentGap),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Expanded(child: InvoiceListSection()),
  //       ],
  //     ),
  //   );
  // }

  // Widget _tabletLayout() {
  //   print("tablet");
  //   return Scaffold(
  //     backgroundColor: APPColors.bodyBackgroundColor,

  //     //navigation
  //     body: Column(
  //       children: [
  //         Container(
  //           color: APPColors.navBackgroundColor,
  //           child: Padding(
  //             padding: AppSizes.screenPadding(context),
  //             child: Column(
  //               children: [
  //                 // ACCOUNTING NAVBAR
  //                 HomeNavBar(),
  //                 SizedBox(height: AppSpacing.navToBreadcrumbGap),

  //                 // NAVBAR
  //                 InvoiceBreadCrumber(),

  //                 SizedBox(height: AppSpacing.breadcrumbToContentGap),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Expanded(child: InvoiceListSection()),
  //       ],
  //     ),
  //   );
  // }
}
