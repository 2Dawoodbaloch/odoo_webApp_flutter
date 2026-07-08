import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/custom_container.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/widgets/text_widget.dart';

class ResumeTabContent extends StatelessWidget {
  const ResumeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // ✅ good practice, see below
          children: [
            Expanded(
              // ✅ takes 50% of Row width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "RESUME",
                    style: TextStyle(
                      fontSize: AppTextSize.bodyDesktop,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: AppSpacing.lg),
                  TextWidget(
                    text: "There are no resume lines on this employee",
                    color: APPColors.textLight,
                  ),
                  SizedBox(height: AppSpacing.md),
                  CustomButton(
                    title: "Create Resume Lines",
                    backgroundColor: APPColors.btnGrey,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md), // gap between the two columns
            Expanded(
              // ✅ takes the other 50%
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SKILLS & CERTIFICATIONS",
                    style: TextStyle(
                      fontSize: AppTextSize.bodyDesktop,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),

                  TextWidget(
                    text:
                        '''You can add skills from our library to the employee profile.
If skills are missing, they can be created by an HR officer.''',
                    color: APPColors.textLight,
                  ),
                  SizedBox(height: AppSpacing.md),
                  CustomButton(
                    title: "Pick a Skill from the list",
                    backgroundColor: APPColors.btnGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
