import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/widgets/custom_form_field.dart';

class EmployeeFormField extends StatelessWidget {
  const EmployeeFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomFormField(hint: "Enter Employer Name",enableBorder: true,),
          CustomFormField(icon: Icons.email, hint: "jeanimeo@gmail.com",enableBorder: true,),
          CustomFormField(icon: Icons.phone, hint: "Work Phone",enableBorder: true,),
          CustomFormField(icon: Icons.tablet, hint: "Work Mobile",enableBorder: true),
          CustomFormField(
            icon: Icons.foundation_rounded,
            hint: "phone",enableBorder: true,
          ),
        ],
      ),
    );
  }
}