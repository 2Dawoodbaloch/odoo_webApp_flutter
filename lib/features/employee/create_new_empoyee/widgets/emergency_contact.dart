import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';

class Emergency_Contact extends StatelessWidget {
  const Emergency_Contact({
    super.key,
    required this.labelWidth,
  });

  final double labelWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Emergency Contact",
            style: TextStyle(
              fontSize: AppTextSize.bodyDesktop,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          SizedBox(height: AppSpacing.lg),
    
          // contact
          Row(
            children: [
              TextWidget(text: "Contact", labelWidth: labelWidth),
              const SizedBox(width: 4),
    
              Expanded(child: CustomFormField(enableBorder: false)),
            ],
          ),
          SizedBox(height: AppSpacing.md),
          // phone
          Row(
            children: [
              TextWidget(text: "Phone", labelWidth: labelWidth),
              const SizedBox(width: 4),
    
              Expanded(child: CustomFormField(enableBorder: false)),
            ],
          ),
        ],
      ),
    );
  }
}
