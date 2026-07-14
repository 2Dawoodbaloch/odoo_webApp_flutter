import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/controller/controller.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/controller/create_invoice_controller.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:get/get.dart';

class ReactiveInvoiceButton extends StatelessWidget {
  const ReactiveInvoiceButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InvoiceEntriesController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomButton(
              title: "Confirm",
              backgroundColor: APPColors.btnPurple,
              textColor: Colors.white,
              padding: AppButtonSize.btnPaddingSymm,
              onPressed: () {
                final controller = Get.find<CreateInvoiceController>();
                controller.postEntry();
                Get.back();
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
    );
  }
}
