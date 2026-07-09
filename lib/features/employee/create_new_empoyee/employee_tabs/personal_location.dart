import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';

class Personal_Location extends StatelessWidget {
  const Personal_Location({
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
            "Location",
            style: TextStyle(
              fontSize: AppTextSize.bodyDesktop,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          SizedBox(height: AppSpacing.lg),
          // private address
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "Private Address",
                labelWidth: labelWidth,
              ),
              const SizedBox(width: 4),
    
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Street 1
                    CustomFormField(
                      enableBorder: false,
                      hint: "Street...",
                    ),
                    const SizedBox(height: 4),
    
                    // Street 2
                    CustomFormField(
                      enableBorder: false,
                      hint: "Street 2...",
                    ),
                    const SizedBox(height: 4),
    
                    // City / State / ZIP — three fields in one row
                    Row(
                      children: [
                        Expanded(
                          flex:
                              2, // City gets more space, matches your screenshot's proportions
                          child: CustomFormField(
                            enableBorder: true,
                            hint: "City",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: CustomFormField(
                            enableBorder: true,
                            hint: "State",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1, // ZIP is shorter, gets less space
                          child: CustomFormField(
                            enableBorder: true,
                            hint: "ZIP",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
    
                    // Country
                    CustomFormField(
                      enableBorder: true,
                      hint: "Country",
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