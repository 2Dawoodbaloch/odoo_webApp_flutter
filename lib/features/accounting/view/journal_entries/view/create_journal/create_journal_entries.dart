import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/app_footer.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/navbar/custom_header.dart';
import 'package:flutter_odoo/comm/widgets/second_footer.dart';
import 'package:flutter_odoo/comm/widgets/tab_section.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/model/column_model.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/widget/create_invoice_tab_section.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/widget/list_view_header.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/accounting_navbar.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/empty_state_view.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';

class CreateJournalEntries extends StatefulWidget {
  const CreateJournalEntries({super.key});

  @override
  State<CreateJournalEntries> createState() => _JournalEntriesHomeState();
}

class _JournalEntriesHomeState extends State<CreateJournalEntries> {
  bool selectAll = false;
  final double labelwidth = 130;
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
                        textColor: Colors.white,
                        padding: AppButtonSize.btnPaddingSymm,
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

              // big container
              Container(
                width: double.infinity,
                padding: AppSpacing.bigContainer,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(hint: "MISC/2026/000007"),
                    SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        // left section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextWidget(
                                    text: "Reference",
                                    labelWidth: 130,
                                  ),
                                  Expanded(child: TextFormField()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: AppSpacing.md),
                        // right section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextWidget(text: "Jounal", labelWidth: 130),
                                  Expanded(
                                    child: CustomFormField(
                                      hint: "Miscellaneous Operations",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: AppSpacing.sm),
                              Row(
                                children: [
                                  TextWidget(
                                    text: "Accounting Date",
                                    labelWidth: 130,
                                  ),
                                  Expanded(
                                    child: CustomFormField(hint: "19/10/2026"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSpacing.lg,),

                    // tab section
                    TabsSection(
                      tabs: [

                        // journal tab
                        TabItem(
                          label: "Journal",
                          content: Column(
                            children: [
                              ListViewHeader(
                                columns: const [
                                  InvoiceHeaderModel(label: "Account", flex: 2),
                                  InvoiceHeaderModel(label: "Partner", flex: 2),
                                  InvoiceHeaderModel(label: "Label", flex: 2),
                                  InvoiceHeaderModel(
                                    label: "Debit",
                                    flex: 2,
                                    sortable: true,
                                  ),
                                  InvoiceHeaderModel(label: "Credit", flex: 2),
                                  InvoiceHeaderModel(label: "Tax", flex: 2),
                                ],
                              ),

                              Center(child: Text("Invoices lines")),
                            ],
                          ),
                        ),


                        TabItem(label: "Other Info", content: Container())
                      ],
                    ),
                  ],
                ),
              ),

        SizedBox(height: AppSpacing.lg,),
              SecondFooter(),
              SizedBox(height: AppSpacing.lg,),
              AppFooter()
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
