import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';

class ActionBarPayment extends StatelessWidget {
  const ActionBarPayment({super.key});

  @override
  Widget build(BuildContext context) {
  
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
