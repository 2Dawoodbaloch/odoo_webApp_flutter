import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';

class SecondFooter extends StatelessWidget {
  const SecondFooter({
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
              title: "Send message",
              backgroundColor: APPColors.btnPurple,
              textColor: APPColors.textWhite,
            ),
            SizedBox(width: AppSpacing.spaceBtwInputFields),
            CustomButton(
              title: "Log note",
              backgroundColor: APPColors.btnGrey,
            ),
            SizedBox(width: AppSpacing.spaceBtwInputFields),
            CustomButton(
              title: "Activity",
              backgroundColor: APPColors.btnGrey,
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: AppSpacing.spaceBtwInputFields),
            Icon(Icons.attach_file),
            SizedBox(width: AppSpacing.spaceBtwInputFields),
            Icon(Icons.person_outline),
          ],
        ),
      ],
    );
  }
}