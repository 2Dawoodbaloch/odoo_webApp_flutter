import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/app_footer.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/date_form_field.dart';
import 'package:flutter_odoo/comm/widgets/second_footer.dart';
import 'package:flutter_odoo/comm/widgets/tab_section.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/model/column_model.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/model/customer_model.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/model/journal_model.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/widget/create_invoice_tab_section.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/widget/invoice_header.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/widget/list_view_header.dart';
import 'package:flutter_odoo/features/accounting/view/widgets/accounting_navbar.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/employee_tabs/payroll_tab_content.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/employee_tabs/personal_tab_content.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/employee_tabs/resume_tab_content.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/employee_tabs/work_tab_content.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';

class CreateInvoice extends StatefulWidget {
  const CreateInvoice({super.key});

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}

class _CreateInvoiceState extends State<CreateInvoice> {
  List<CustomerModel> customer = [
    CustomerModel(id: 1, name: "Dawood"),
    CustomerModel(id: 2, name: "Rashid"),
    CustomerModel(id: 3, name: "Sharukh"),
  ];

  List<JournalModel> journal = [
    JournalModel(id: 1, name: "Sales"),
    JournalModel(id: 2, name: "Service"),
    JournalModel(id: 3, name: "Product"),
  ];
  CustomerModel? selectCustomer;
  JournalModel? selectJournal;
  DateTime? birthday;

  final double labelWidth = 130;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomButton(
                      title: "Confirm",
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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          TextWidget(text: "Customer  Invoices"),
                          SizedBox(height: AppSpacing.md),
                          CustomFormField(hint: "INV/2026/000001"),
                          SizedBox(height: AppSpacing.md),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    TextWidget(
                                      labelWidth: labelWidth,
                                      text: "Customer",
                                    ),

                                    Expanded(
                                      child:
                                          SearchableDropdownField<
                                            CustomerModel
                                          >(
                                            items: customer,
                                            labelBuilder: (m) => m.name,
                                            onSelected: (value) => setState(
                                              () => selectCustomer = value,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: AppSpacing.md),

                              // right section
                              Expanded(
                                child: Column(
                                  children: [
                                    // invoice date
                                    Row(
                                      children: [
                                        TextWidget(
                                          text: "Invoice",
                                          labelWidth: labelWidth,
                                        ),
                                        Expanded(
                                          child: DateFormField(
                                            hint: "today",
                                            onDateSelected: (date) {
                                              setState(() => birthday = date);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: AppSpacing.sm),
                                    // due date + payment terms
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              TextWidget(
                                                text: "Due data",
                                                labelWidth: labelWidth,
                                              ),
                                              Expanded(
                                                child: DateFormField(
                                                  hint: "MM/DD/YYYY",
                                                  onDateSelected: (date) {
                                                    setState(
                                                      () => birthday = date,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: AppSpacing.sm),
                                        // payment
                                        Expanded(
                                          child: Row(
                                            children: [
                                              TextWidget(
                                                text: "or",
                                                labelWidth: labelWidth,
                                              ),
                                              Expanded(
                                                child:
                                                    SearchableDropdownField<
                                                      CustomerModel
                                                    >(
                                                      items: customer,
                                                      hintText: "Payment terms",
                                                      labelBuilder: (m) =>
                                                          m.name,
                                                      onSelected: (value) =>
                                                          setState(
                                                            () =>
                                                                selectCustomer =
                                                                    value,
                                                          ),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // journal
                                    SizedBox(height: AppSpacing.sm),
                                    // due date + payment terms
                                    Row(
                                      children: [
                                        TextWidget(
                                          text: "Journal",
                                          labelWidth: labelWidth,
                                        ),
                                        Expanded(
                                          child:
                                              SearchableDropdownField<
                                                JournalModel
                                              >(
                                                items: journal,
                                                labelBuilder: (m) => m.name,
                                                onSelected: (value) => setState(
                                                  () => selectJournal = value,
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSpacing.lg),

                          // tab
                          CreateInvoiceTabSection(),
                        ],
                      ),
                    ),
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
