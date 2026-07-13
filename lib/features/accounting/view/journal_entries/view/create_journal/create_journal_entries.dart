import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/app_footer.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/navbar/custom_header.dart';
import 'package:flutter_odoo/comm/widgets/second_footer.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/model/journal_model.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/controller/journal_controller.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/widget/add_info_journal_entries.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/accounting_navbar.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CreateJournalEntries extends StatefulWidget {
  const CreateJournalEntries({super.key});

  @override
  State<CreateJournalEntries> createState() => _JournalEntriesHomeState();
}

class _JournalEntriesHomeState extends State<CreateJournalEntries> {
  bool selectAll = false;
  final double labelwidth = 130;
  final controller = Get.find<CreateJournalEntriesController>();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.desktopPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                ],
                icon: Icons.settings,
              ),

              SizedBox(height: AppSpacing.xs),

              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomButton(
                        title: "Post",
                        backgroundColor: APPColors.btnPurple,
                        textColor:APPColors.white,
                        onPressed: () {
                    
                        }, 
                      ),
                      SizedBox(width: AppSpacing.sm),
                      CustomButton(
                        title: "Cancel",
                        backgroundColor: APPColors.btnGrey,
                        textColor: Colors.black,
                        padding: AppButtonSize.btnPaddingSymm,
                      ),
                    ],
                  ),
                  CustomButton(
                    title: "Draft",
                    backgroundColor: APPColors.btnGrey,
                    padding: AppButtonSize.btnPaddingSymm,
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.sm),

              // add journal entries
              AddInfoJournalEntries(),

              SizedBox(height: AppSpacing.lg),
              SecondFooter(),
              SizedBox(height: AppSpacing.lg),
              AppFooter(),
            ],
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
