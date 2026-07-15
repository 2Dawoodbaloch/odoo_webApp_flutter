import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/controller/create_invoice_controller.dart';
import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/model/customer_model.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/controller/add_payment_controller.dart';
import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/widget/custom_radio_option.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/enum.dart';
import 'package:get/instance_manager.dart';

class PaymentAddField extends StatelessWidget {
  PaymentAddField({super.key});
  final controller = Get.find<AddPaymentController>();
  final createInvoicecontroller = Get.find<CreateInvoiceController>();
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
                    SizedBox(height: AppSpacing.sm,),
                     Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(labelWidth: labelWidth, text: "Customer"),

                    Expanded(
                      child: SearchableDropdownField<CustomerModel>(
                        items: controller.customer,
                        labelBuilder: (m) => m.name,
                        selectedItem: createInvoicecontroller.selectCustomer.value,
                        onSelected: (value) => createInvoicecontroller.selectCustomer(value),
                      ),
                    ),
                  ],
                ),
              ),
                  ],
                ),
              ),

              // right section
              Expanded(child: Column(children: [Text("hye")])),
            ],
          ),
        ],
      ),
    );
  }
}
