import 'package:flutter/material.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/employee_tabs/payroll_tab_content.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/employee_tabs/personal_tab_content.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/employee_tabs/resume_tab_content.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/employee_tabs/work_tab_content.dart';

class EmployeeTabsSection extends StatefulWidget {
  const EmployeeTabsSection({super.key});

  @override
  State<EmployeeTabsSection> createState() => _EmployeeTabsSectionState();
}

class _EmployeeTabsSectionState extends State<EmployeeTabsSection> {
  final List<String> tabs = ["Work", "Resume", "Personal", "Payroll"];

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs
        Row(
          children: List.generate(tabs.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: selectedTab == index ? Colors.purple : Colors.grey,
                      width: 3,
                    ),
                    left: const BorderSide(color: Colors.grey),
                    right: const BorderSide(color: Colors.grey),
                  
                  ),
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    color: selectedTab == index ? Colors.purple : Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            );
          }),
        ),

         SizedBox(height: AppSpacing.md),

        // Content
        _buildTabContent(),

        
      ],
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0:
        return const WorkTabContent();

      case 1:
        return const ResumeTabContent();

      case 2:
        return const PersonalTabContent();

      case 3:
        return PayrollTabContent();

      default:
        return const SizedBox();
    }
  }
}
