import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';
import 'package:flutter_odoo/comm/widgets/date_form_field.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/customer_model.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/controller/add_payment_controller.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/model/company_bank.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/model/journal_model.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/model/payment_method.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/widget/custom_radio_option.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/enum.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class PaymentAddField extends StatelessWidget {
  PaymentAddField({super.key});
  final controller = Get.find<AddPaymentController>();
  final double labelWidth = 130;
  @override
  Widget build(BuildContext context) {
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
          TextWidget(text: "Draft", fontSize: AppTextSize.headingDesktop),
          SizedBox(height: AppSpacing.md),

          Row(
            children: [
              // left section
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextWidget(text: "Payment Type", labelWidth: 130),
                        CustomRadioOption<PaymentType>(
                          label: "Send",
                          value: PaymentType.send,
                          groupValue: controller.selectedType.value,
                          onChanged: (value) =>
                              controller.setPaymentType(value!),
                        ),
                        const SizedBox(width: 16),
                        CustomRadioOption<PaymentType>(
                          label: "Receive",
                          value: PaymentType.receive,
                          groupValue: controller.selectedType.value,
                          onChanged: (value) =>
                              controller.setPaymentType(value!),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(labelWidth: labelWidth, text: "Customer"),

                        Expanded(
                          child: Obx(
                            () => SearchableDropdownField<CustomerModel>(
                              items: controller.customer,
                              labelBuilder: (m) => m.name,
                              selectedItem: controller.selectCustomer.value,
                              onSelected: (value) =>
                                  controller.customerChoose(value),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),
                    // amount
                    Row(
                      children: [
                        TextWidget(labelWidth: labelWidth, text: "Amout"),
                        Expanded(
                          child: CustomFormField(
                            enableBorder: true,
                            controller: controller.amountController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),

                    // date
                    Row(
                      children: [
                        TextWidget(labelWidth: labelWidth, text: "Date"),
                        Expanded(
                          child: Obx(
                            () => DateFormField(
                              hint: "2/4/2026",
                              controller: controller.dateController,
                              selectedDate: controller.selectedDate.value,
                              onDateSelected: (date) =>
                                  controller.selectDate(date),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),
                    // memo
                    Row(
                      children: [
                        TextWidget(labelWidth: labelWidth, text: "Memo"),
                        Expanded(
                          child: CustomFormField(
                            enableBorder: true,
                            controller: controller.memo,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSpacing.spaceBtwRwCl),
              // right section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Journal
                    Row(
                      children: [
                        TextWidget(text: "Journal", labelWidth: labelWidth,  fontWeight: FontWeight.bold,),
                        Expanded(
                          child: Obx(
                            () => SearchableDropdownField<JournalModel>(
                              items: controller.journal,
                              labelBuilder: (m) => m.name,
                              selectedItem: controller.selectedJournal.value,
                              onSelected: (value) =>
                                  controller.selectJournal(value),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),

                    // Payment Method (with help icon)
Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: Text(
                            "Payment Method",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                       Expanded(
                          child: Obx(
                            () => SearchableDropdownField<PaymentMethod>(
                              items: controller.paymentMethod,
                              labelBuilder: (m) => m.name,
                              selectedItem: controller.selectedPaymentMethod.value,
                              onSelected: (value) =>
                                  controller.selectPaymentMethod(value),
                            ),
                          ),
                        ), // empty value area, matches screenshot
                      ],
                    ),
                    SizedBox(height: AppSpacing.spaceBtwInputFields),

                    // Company Bank Account (label wraps to 2 lines)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: Text(
                            "Company Bank Account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                       Expanded(
                          child: Obx(
                            () => SearchableDropdownField<CompanyBank>(
                              items: controller.compnayBank,
                              labelBuilder: (m) => m.name,
                              selectedItem: controller.selectedBank.value,
                              onSelected: (value) =>
                                  controller.selectCompanyBank(value),
                            ),
                          ),
                        ), // empty value area, matches screenshot
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
}
