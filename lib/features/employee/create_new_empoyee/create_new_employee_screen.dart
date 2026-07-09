import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/compact_tile.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/widgets/label_divider.dart';
import 'package:flutter_odoo/utils/constants/app_icon_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
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
              const _LeftSection(),
              const _MidSection(),
              const _RightSection(),
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomButton(
                    title: "Send message",
                    backgroundColor: APPColors.btnPurple,
                    textColor: APPColors.textWhite,
                  ),
                  SizedBox(width: AppSpacing.sm),
                  CustomButton(
                    title: "Log note",
                    backgroundColor: APPColors.btnGrey,
                  ),
                  SizedBox(width: AppSpacing.sm),
                  CustomButton(
                    title: "Activity",
                    backgroundColor: APPColors.btnGrey,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: AppSpacing.sm),
                  Icon(Icons.attach_file),
                  SizedBox(width: AppSpacing.sm),
                  Icon(Icons.person_outline),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.lg),
          // Label Divider
          LabeledDivider(label: "Today"),

          // footer
          SizedBox(
            width: 300,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/images.jpg"),
              ),
              title: Text("Muhammad Dawood"),
              subtitle: Text("create new info...."),
              trailing: Text("12:30 PM"),
            ),
          ),
        ],
      ),
    ],
  );
}

class _LeftSection extends StatelessWidget {
  const _LeftSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         CustomButton(title: "New",textColor: APPColors.btnPurple,borderWidth: 1,borderColor: APPColors.btnPurple,),
          SizedBox(width: 8),
          Text(
            "Employee",
            style: TextStyle(
              fontSize: AppTextSize.headingDesktop,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.settings, size: AppIconSize.md),
        ],
      ),
    );
  }
}

class _MidSection extends StatelessWidget {
  const _MidSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CompactTile(
          leadingIcon: Icons.edit_document,
          title: "document",
          subtitle: "Consultant",
          onTap: () {},
        ),
      ),
    );
  }
}

class _RightSection extends StatelessWidget {
  const _RightSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Icon(Icons.search_sharp, color: Colors.purple)],
      ),
    );
  }
}

Widget _mobileLayout() {
  return Column();
}

Widget _tabletLayout() {
  return Column();
}
