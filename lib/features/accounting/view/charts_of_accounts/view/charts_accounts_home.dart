import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/navbar/custom_header.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/model/column_model.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/widget/list_view_header.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/accounting_navbar.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/empty_state_view.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:get/get_core/src/get_main.dart';

class ChartsAccountsHomeScreen extends StatefulWidget {
  const ChartsAccountsHomeScreen({super.key});

  @override
  State<ChartsAccountsHomeScreen> createState() =>
      _ChartsAccountsHomeScreenState();
}

class _ChartsAccountsHomeScreenState extends State<ChartsAccountsHomeScreen> {
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: AppSpacing.desktopPadding,
        child: Column(
          children: [
            //top nav bar
            AccountingNavBar(),
            SizedBox(height: AppSpacing.sm),

            // HEADER
            CustomHeader(
              title: "Journal Entries",
              actions: [
                CustomButton(
                  title: "New",
                  backgroundColor: APPColors.btnPurple,
                  textColor: APPColors.white,
                  padding: AppButtonSize.btnPaddingSymm,
                  onPressed: (){},
                ),
              ],
              icon: Icons.settings,
            ),

            SizedBox(height: AppSpacing.xs),

            Divider(),

            ListViewHeader(
              columns: const [
                InvoiceHeaderModel(label: "Date", flex: 2),
                InvoiceHeaderModel(label: "Number", flex: 2),
                InvoiceHeaderModel(label: "Partner", flex: 2),
                InvoiceHeaderModel(label: "Reference", flex: 2, sortable: true),
                InvoiceHeaderModel(label: "Journal", flex: 2),
                InvoiceHeaderModel(label: "Totall", flex: 2),
                InvoiceHeaderModel(label: "Status", flex: 1),
              ],
              trailingIcon: Icons.tune,
              onSelectAllChanged: (value) {
                setState(() => selectAll = value ?? false);
              },
            ),

            // Card Screen
            EmptyStateView(
              title: "Create a create journal Entries",
              description:
                  "Create Journal Entreis, register payments and keep track of the discussions with your customers.",
              icon: Icons.help_outline,
            ),
          ],
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
