import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/navbar/custom_navbar.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/accounting_navbar.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // ACCOUNTING NAVBAR
              AccountingNavBar(),
              SizedBox(height: AppSpacing.md),

              // NAVBAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Row(
                  children: [
                     CustomButton(
                    title: "New",
                    backgroundColor: APPColors.btnPurple,
                    textColor: Colors.white,
                    padding: AppButtonSize.btnPaddingSymm,
                  ),
                  SizedBox(width: AppSpacing.sm,),
                  TextWidget(text: "Invoices",color: Colors.green,)
                  ],
                 ),
                  Icon(Icons.accessibility_new),
                ],
              ),
              SizedBox(height: AppSpacing.sm),
              Divider(),
              SizedBox(height: AppSpacing.xxs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    title: "Confirm",
                    backgroundColor: APPColors.btnPurple,
                    textColor: Colors.white,
                    padding: AppButtonSize.btnPaddingSymm,
                  ),
                  CustomButton(
                    title: "Draft",
                    backgroundColor: APPColors.btnGrey,
                    padding: AppButtonSize.btnPaddingSymm,
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.xxs),
              Divider(),
            ], // 2nd Row
          ),
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
