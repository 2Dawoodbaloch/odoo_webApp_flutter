import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/app_footer.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/second_footer.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/widget/customer_invoice.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/widget/invoice_header.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/widget/reactive_invoice_buttons.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/accounting_navbar.dart';
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
      backgroundColor: APPColors.white,

      //navigation
      body: Padding(
        padding: AppSpacing.desktopPadding,

        child: Column(
          children: [
            // ACCOUNTING NAVBAR
            AccountingNavBar(),
            SizedBox(height: AppSpacing.md),

            // NAVBAR/ Header
            HeaderInvoice(),

            SizedBox(height: AppSpacing.sm),
            Divider(),
            SizedBox(height: AppSpacing.xxs),

            // 2nd  confirm + draft button
            ReactiveInvoiceButton(),

            SizedBox(height: AppSpacing.sm),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

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


