import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';
import 'package:flutter_odoo/comm/widgets/date_form_field.dart';
import 'package:flutter_odoo/comm/widgets/tab_section.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/controller/create_invoice_controller.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/customer_model.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/journal_model.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/payment_terms.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/widget/invoice_line_table.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:get/get.dart'; // ✅ single import covers Get.find, Obx, GetxController, everything

class CustomerInvoice extends StatelessWidget {
  const CustomerInvoice({super.key});

  final double labelWidth = 130;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateInvoiceController>();
    return Container(
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

          // INV FIELD
          CustomFormField(
            hint: "INV/2026/000001",
            controller: controller.invController,
          ),
          SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(labelWidth: labelWidth, text: "Customer"),

                    Expanded(
                      child: SearchableDropdownField<CustomerModel>(
                        items: controller.customer,
                        labelBuilder: (m) => m.name,
                        selectedItem: controller.selectCustomer.value,
                        onSelected: (value) => controller.selectCustomer(value),
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
                        TextWidget(text: "Invoice", labelWidth: labelWidth),
                        Expanded(
                          child: Obx(() {
                            return DateFormField(
                              hint: "today",
                              controller: controller.invoiceDatecontroller,
                              selectedDate: controller.selectInvoiceDate.value,
                              onDateSelected: (date) =>
                                  controller.selectInvoicDate(date),
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),

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
                                child: Obx(() {
                                  return DateFormField(
                                    hint: "MM/DD/YYYY",
                                    controller: controller.dueDatecontroller,
                                    selectedDate:
                                        controller.selectDueDate.value,
                                    onDateSelected: (date) =>
                                        controller.selectDuDate(date),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: AppSpacing.spaceBtwInputFields),
                        // payment
                        Expanded(
                          child: Row(
                            children: [
                              TextWidget(text: "or", labelWidth: labelWidth),
                              Expanded(
                                child: Obx(
                                  () => SearchableDropdownField<PaymentTerms>(
                                    items: controller.paymentTerms,
                                    hintText: "Payment terms",
                                    labelBuilder: (m) => m.name,
                                    selectedItem:
                                        controller.selectPaymentTerms.value,
                                    onSelected: (terms) =>
                                        controller.paymentCondition(terms),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // journal
                    SizedBox(height: AppSpacing.spaceBtwInputFields),
                    // due date + payment terms
                    Row(
                      children: [
                        TextWidget(text: "Journal", labelWidth: labelWidth),
                        Expanded(
                          child: Obx(
                            () => SearchableDropdownField<JournalModel>(
                              items: controller.journal,
                              labelBuilder: (m) => m.name,
                              selectedItem: controller.selectJournal.value,
                              onSelected: (value) =>
                                  controller.journalChoose(value),
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

          //---------------------------------we update old tab to new one ------------------------------
          // // create invoice tab section
          // CreateInvoiceTabSection(),

          // tab
          TabsSection(
            tabs: [
              TabItem(label: "Journal Items", content: InvoiceLineTable()),
              TabItem(
                label: "Other Info",
                content: Center(child: Text("Nothing")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
