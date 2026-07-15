import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/date_form_field.dart';
import 'package:flutter_odoo/comm/widgets/custom_form_field.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/enum.dart';

class PayrollTabContent extends StatefulWidget {
  const PayrollTabContent({super.key});

  @override
  State<PayrollTabContent> createState() => _PayrollTabContentState();
}

class _PayrollTabContentState extends State<PayrollTabContent> {
  PayCategory selectedPayCategory = PayCategory.employee;
  ScheduleType selectedScheduleType = ScheduleType.fullTime;
  Sex? selectedSex;
  DateTime? birthday;
  final double labelWidth = 130;
  bool isFixedTerm = false;
  double wage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contract Overview
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CONTRACTS & OVERVIEW",
                    style: TextStyle(
                      fontSize: AppTextSize.bodyDesktop,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: AppSpacing.lg),

                  // EMPLOYEE ROW
                  Row(
                    children: [
                      TextWidget(text: "Employee Type", labelWidth: labelWidth),
                      const SizedBox(width: 4),

                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SearchableDropdownField<Sex>(
                              hintText: "Select Employee Type",
                              items: Sex
                                  .values, // ✅ built-in — every enum has `.values` automatically
                              labelBuilder: (sex) => sex.label,
                              onSelected: (value) =>
                                  setState(() => selectedSex = value),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.spaceBtwInputFields),

                  // Contract
                  Row(
                    children: [
                      TextWidget(text: "Contract", labelWidth: labelWidth),
                      Expanded(
                        child: DateFormField(
                          hint: "Not Employed",
                          onDateSelected: (date) {
                            setState(() => birthday = date);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSpacing.spaceBtwInputFields),

                  // fixed term
                  Row(
                    children: [
                      TextWidget(text: "Fixed Term", labelWidth: labelWidth),
                      Checkbox(
                        value: isFixedTerm,
                        onChanged: (value) {
                          setState(() => isFixedTerm = value ?? false);
                        },
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.spaceBtwInputFields),
                  // Wage
                  Row(
                    children: [
                      TextWidget(
                        text: "Wage",
                        labelWidth: 130,
                        tooltip:
                            "The employee's gross wage, before any deductions or bonuses.",
                      ),

                      SizedBox(
                        width: labelWidth,
                        child: CustomFormField(
                          enableBorder: false,
                          hint: "0.00",
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          suffixText: "Rs.", // see note below
                          onChanged: (value) {
                            setState(
                              () => wage = double.tryParse(value) ?? 0.0,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.spaceBtwInputFields),
                  // page category
                  Row(
                    children: [
                      TextWidget(text: "Pay Category", labelWidth: labelWidth),
                      Expanded(
                        child: SearchableDropdownField<PayCategory>(
                          items: PayCategory.values,
                          labelBuilder: (cat) => cat.label,
                          selectedItem: selectedPayCategory,
                          onSelected: (value) =>
                              setState(() => selectedPayCategory = value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(child: Container()),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // scedule
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SCHEDULE",
                    style: TextStyle(
                      fontSize: AppTextSize.bodyDesktop,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: AppSpacing.lg),
                  Row(
                    children: [
                      TextWidget(
                        text: "Working Hours",
                        labelWidth: 130,
                        tooltip:
                            "The employee's gross wage, before any deductions or bonuses.",
                      ),

                      Expanded(
                        child: SearchableDropdownField<ScheduleType>(
                          items: ScheduleType.values,
                          labelBuilder: (opt) => opt.label,
                          hintText: "Select working hours",
                          onSelected: (value) =>
                              setState(() => selectedScheduleType = value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(child: Container()),
          ],
        ),
      ],
    );
  }
}
