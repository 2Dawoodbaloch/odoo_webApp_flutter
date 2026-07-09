import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/navbar/custom_navbar.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/model/column_model.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/widget/list_view_header.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/accounting_navbar.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/empty_state_view.dart';
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
  bool selectAll = false;
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
      backgroundColor: APPColors.white,
      //navigation
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // ACCOUNTING NAVBAR
              AccountingNavBar(),
              SizedBox(height: AppSpacing.md),
              // NAVBAR
              CustomNavBar(
                title: "Invoices",
                icon: Icons.settings,
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
                  const SizedBox(width: 8),
                  CustomButton(
                    title: "Upload",
                    onPressed: () {},
                    backgroundColor: APPColors.btnGrey,
                    padding: AppButtonSize.btnPaddingSymm,
                    textColor: APPColors.black,
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.sm),
              Divider(),

              ListViewHeader(
                columns: const [
                  InvoiceHeaderModel(label: "Number", flex: 2),
                  InvoiceHeaderModel(label: "Customer", flex: 2),
                  InvoiceHeaderModel(label: "Invoice Date", flex: 2),
                  InvoiceHeaderModel(
                    label: "Due Date",
                    flex: 2,
                    sortable: true,
                  ),
                  InvoiceHeaderModel(label: "Last Remin...", flex: 2),
                  InvoiceHeaderModel(
                    label: "Tax Excluded",
                    flex: 2,
                    alignment: Alignment.centerRight,
                  ),
                  InvoiceHeaderModel(
                    label: "Total",
                    flex: 1,
                    alignment: Alignment.centerRight,
                  ),
                  InvoiceHeaderModel(
                    label: "Amount Due",
                    flex: 2,
                    alignment: Alignment.centerRight,
                  ),
                  InvoiceHeaderModel(label: "Status", flex: 1),
                ],
                trailingIcon: Icons.tune,
                onSelectAllChanged: (value) {
                  setState(() => selectAll = value ?? false);
                },
              ),

              // Card Screen
              EmptyStateView(
                title: "Create a customer invoice",
                description:
                    "Create invoices, register payments and keep track of the discussions with your customers.",
                icon: Icons.help_outline,
              ),
            ],
          ),
        ),
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
