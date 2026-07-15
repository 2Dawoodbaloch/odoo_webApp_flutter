import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/controller/journal_controller.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
      final controller = Get.find<CreateJournalEntriesController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomButton(
              title: "Post",
              backgroundColor: APPColors.btnPurple,
              textColor: APPColors.white,
              padding: AppButtonSize.btnPaddingSymm,
              onPressed: () {
                controller.postEntry();
                Get.back(); // return to Home screen
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