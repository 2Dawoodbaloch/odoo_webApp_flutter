
import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';

class HeaderInvoice extends StatelessWidget {
  const HeaderInvoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomButton(
              title: "New",
              backgroundColor: APPColors.btnPurple,
              textColor: Colors.white,
              padding: AppButtons.btnPaddingSymm,
            ),
            SizedBox(width: AppSpacing.spaceBtwInputFields),
            TextWidget(text: "Invoices", color: Colors.green),
          ],
        ),
        Icon(Icons.accessibility_new),
      ],
    );
  }
}
