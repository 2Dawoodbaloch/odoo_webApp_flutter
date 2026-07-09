import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';
import 'package:flutter_odoo/comm/widgets/tab_section.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/model/column_model.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/widget/list_view_header.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';

class CreateInvoiceTabSection extends StatelessWidget {
  const CreateInvoiceTabSection({super.key});

  final double labelWidth = 130;

  @override
  Widget build(BuildContext context) {
    return TabsSection(
      tabs: [
        // invoice tab item
        invoiceTabItem(),

        // Journal tab item
        journalTabItem(),

        otherTabItem(),
      ],
    );
  }

  TabItem otherTabItem() {
    return TabItem(
      label: "Other Info",
      content: Column(
        children: [
          Row(
            children: [
              // left section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Invoice",
                      style: TextStyle(
                        fontSize: AppTextSize.bodyDesktop,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Divider(),
                    const SizedBox(height: AppSpacing.lg),

                    // customer ref
                    Row(
                      children: [
                        TextWidget(
                          text: "Customer Ref",
                          labelWidth: labelWidth,
                        ),

                        const Expanded(
                          child: CustomFormField(enableBorder: true),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    //sales person
                    Row(
                      children: [
                        TextWidget(
                          text: "Sales Person",
                          labelWidth: labelWidth,
                        ),

                        const Expanded(
                          child: CustomFormField(enableBorder: true),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    //Reciepent bank
                    Row(
                      children: [
                        TextWidget(
                          text: "Reciepent Bank",
                          labelWidth: labelWidth,
                        ),

                        const Expanded(
                          child: CustomFormField(enableBorder: true),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    // payment reference
                    Row(
                      children: [
                        TextWidget(
                          text: "Payment Reference",
                          labelWidth: labelWidth,
                        ),

                        const Expanded(
                          child: CustomFormField(enableBorder: true),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    //delivery date
                    Row(
                      children: [
                        TextWidget(
                          text: "Delivery data",
                          labelWidth: labelWidth,
                        ),

                        const Expanded(
                          child: CustomFormField(enableBorder: true),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: AppSpacing.md),
              // right section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Accounting",
                      style: TextStyle(
                        fontSize: AppTextSize.bodyDesktop,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Divider(),
                    const SizedBox(height: AppSpacing.lg),

                    // customer ref
                    Row(
                      children: [
                        TextWidget(text: "Incoterm", labelWidth: labelWidth),

                        const Expanded(
                          child: CustomFormField(
                            hint: "Default setting in things",
                            enableBorder: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    //sales person
                    Row(
                      children: [
                        TextWidget(
                          text: "Incoterm Location",
                          labelWidth: labelWidth,
                        ),

                        const Expanded(
                          child: CustomFormField(enableBorder: true),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    //Reciepent bank
                    Row(
                      children: [
                        TextWidget(
                          text: "Fiscal Postion",
                          labelWidth: labelWidth,
                        ),

                        const Expanded(
                          child: CustomFormField(enableBorder: true),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    // payment reference
                    Row(
                      children: [
                        TextWidget(
                          text: "Payment Method",
                          labelWidth: labelWidth,
                        ),

                        const Expanded(
                          child: CustomFormField(enableBorder: true),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    //delivery date
                    Row(
                      children: [
                        TextWidget(text: "Auto-Post", labelWidth: labelWidth),

                        const Expanded(
                          child: CustomFormField(enableBorder: true),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TabItem journalTabItem() {
    return const TabItem(
      label: "Journal Items",
      content: Column(
        children: [
          ListViewHeader(
            columns: const [
              InvoiceHeaderModel(label: "Account", flex: 2),
              InvoiceHeaderModel(label: "Acount", flex: 2),
              InvoiceHeaderModel(label: "Label", flex: 2),
              InvoiceHeaderModel(label: "Debit", flex: 2, sortable: true),
              InvoiceHeaderModel(label: "Credit", flex: 2),
              InvoiceHeaderModel(label: "Tax Grids", flex: 2),
            ],
          ),

          Center(child: Text("Add Journal")),
        ],
      ),
    );
  }

  TabItem invoiceTabItem() {
    return const TabItem(
      label: "Invoice Lines",
      content: Column(
        children: [
          ListViewHeader(
            columns: const [
              InvoiceHeaderModel(label: "Label", flex: 2),
              InvoiceHeaderModel(label: "Acount", flex: 2),
              InvoiceHeaderModel(label: "Price", flex: 2),
              InvoiceHeaderModel(label: "Tax", flex: 2, sortable: true),
              InvoiceHeaderModel(label: "Amount", flex: 2),
            ],
          ),

          Center(child: Text("Invoices lines")),
        ],
      ),
    );
  }
}
