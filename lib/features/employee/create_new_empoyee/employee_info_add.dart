import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/employee_form_field.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/employee_tabs/employee_tab_section.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/image_picker.dart';

class EmployeeInfoAdd extends StatelessWidget {
  const EmployeeInfoAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),

      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // IMAGE PICKER
              ImagePickerAvatar(),

              SizedBox(width: 20),

              // EMPLOYEE INFO
              EmployeeFormField(),
            ],
          ),
          SizedBox(height:AppSpacing.lg),
          
          // Employee Tab Section
          EmployeeTabsSection(),
        ],
      ),
    );
  }
}