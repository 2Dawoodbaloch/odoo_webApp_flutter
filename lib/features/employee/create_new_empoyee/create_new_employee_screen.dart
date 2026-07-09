import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/app_footer.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/label_divider.dart';
import 'package:flutter_odoo/comm/widgets/second_footer.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/nav/left_section.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/nav/mid_section.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/nav/right_section.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/screen_break_points.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/employee_info_add.dart';

class CreaateNewEmployeeScreen extends StatefulWidget {
  const CreaateNewEmployeeScreen({super.key});

  @override
  State<CreaateNewEmployeeScreen> createState() => _CreaateNewEmployeeScreen();
}

class _CreaateNewEmployeeScreen extends State<CreaateNewEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: LayoutBuilder(
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
      ),
    );
  }
}

Widget _desktopLayout() {
  return ListView(
    scrollDirection: Axis.vertical,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Layout part1
              const LeftSection(),
              const MidSection(),
              const RightSection(),
            ],
          ),

          // Layout part2
          Divider(),
          // create user button
          CustomButton(
            title: "Create User",
            backgroundColor: APPColors.btnPurple,
            textColor: APPColors.textWhite,
          ),

          SizedBox(height: 8),

          // big Container scrollabe
          EmployeeInfoAdd(),
          SizedBox(height: AppSpacing.lg),
         
         // send message + log note + activity
          SecondFooter(),

          SizedBox(height: AppSpacing.lg),
          // Label Divider
          LabeledDivider(label: "Today"),

          // footer
          AppFooter(),
        ],
      ),
    ],
  );
}










Widget _mobileLayout() {
  return Column();
}

Widget _tabletLayout() {
  return Column();
}
