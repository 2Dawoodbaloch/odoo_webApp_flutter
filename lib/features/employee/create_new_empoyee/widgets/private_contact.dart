import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/help_tool_tip.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';

class Private_Contact extends StatelessWidget {
  const Private_Contact({super.key, required this.labelWidth});

  final double labelWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // ✅ takes 50% of Row width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Private Contact",
            style: TextStyle(
              fontSize: AppTextSize.bodyDesktop,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          SizedBox(height: AppSpacing.lg),

          Row(
            children: [
              TextWidget(text: "Email", labelWidth: labelWidth),
              Expanded(
                child: CustomFormField(
                  enableBorder: true,
                  hint: "marry@gmail.com",
                ),
              ),
            ],
          ),

          Row(
            children: [
              TextWidget(text: "Phone", labelWidth: labelWidth),
              Expanded(
                child: CustomFormField(
                  enableBorder: true,
                  hint: "+9282736783",
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.lg),

          // account
          TextWidget(text: "Bank Accounts", labelWidth: labelWidth),
          const SizedBox(width: 4),
          const HelpTooltip(message: "Choose ur Bank (meezan, ubl,hbl etc.)"),
        ],
      ),
    );
  }
}
