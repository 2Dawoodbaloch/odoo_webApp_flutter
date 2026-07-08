import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/navbar/custom_navbar.dart';
import 'package:flutter_odoo/comm/widgets/navbar/left_section_nav.dart';
import 'package:flutter_odoo/comm/widgets/navbar/right_section_nav.dart';
import 'package:flutter_odoo/features/accounting/screens/accounting/widgets/accounting_navbar.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/widgets/employee_card.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/widgets/sidebar/department_sidebar.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({super.key});

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  String selectedDepartment = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final isDesktop = width >= ScreenBreakPoints.desktop;
          final isTablet =
              width >= ScreenBreakPoints.mobile &&
              width < ScreenBreakPoints.desktop;

          if (isDesktop) {
            return _desktopLayout();
          } else if (isTablet) {
            return _tabletLayout();
          }

          return _mobileLayout();
        },
      ),
    );
  }

  Widget _desktopLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        children: [
          AccountingNavBar(context: context),
          //NAVBAR
          SizedBox(height: AppSpacing.sm),
          CustomNavBar(),

          const SizedBox(height: 8),
          const Divider(),

          // sidebar + Main Screen
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 230,
                  child: DepartmentSidebar(
                    departments: const [
                      DepartmentData('All'),
                      DepartmentData('Administration', 1),
                      DepartmentData('Research & Development', 2),
                    ],
                    onDepartmentSelected: (dept) {
                      setState(() => selectedDepartment = dept.label);
                    },
                  ),
                ),

                // vertical lines
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),

                // employee card
                Expanded(child: EmployeeCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mobileLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        children: [
          AccountingNavBar(context: context),
          //NAVBAR
          SizedBox(height: AppSpacing.sm),
          CustomNavBar(),

          const SizedBox(height: 8),
          const Divider(),

          // sidebar + Main Screen
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 230,
                  child: DepartmentSidebar(
                    departments: const [
                      DepartmentData('All'),
                      DepartmentData('Administration', 1),
                      DepartmentData('Research & Development', 2),
                    ],
                    onDepartmentSelected: (dept) {
                      setState(() => selectedDepartment = dept.label);
                    },
                  ),
                ),

                // vertical lines
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),

                // employee card
                Expanded(child: EmployeeCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabletLayout() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          AccountingNavBar(context: context),
          //NAVBAR
          SizedBox(height: AppSpacing.sm),
          //NAVBAR
          CustomNavBar(),

          const SizedBox(height: 8),
          const Divider(),

          // sidebar + main grid
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ sidebar — fixed width
                SizedBox(
                  width: 280,
                  child: DepartmentSidebar(
                    departments: const [
                      DepartmentData('All'),
                      DepartmentData('Administration', 1),
                      DepartmentData('Research & Development', 2),
                    ],
                    onDepartmentSelected: (dept) {
                      setState(() => selectedDepartment = dept.label);
                    },
                  ),
                ),

                // vertical lines
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),

                // employee card
                Expanded(child: EmployeeCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
