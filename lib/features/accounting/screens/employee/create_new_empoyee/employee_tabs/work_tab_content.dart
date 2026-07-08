import 'package:flutter/material.dart';
import 'package:flutter_odoo/model/department_model.dart';
import 'package:flutter_odoo/model/job_position_model.dart';
import 'package:flutter_odoo/model/manager_model.dart';
import 'package:flutter_odoo/model/work_location_model.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/widgets/searchable_drop_down_menu.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/features/accounting/screens/employee/create_new_empoyee/widgets/custom_form_field.dart';

class WorkTabContent extends StatefulWidget {
  const WorkTabContent({super.key});

  @override
  State<WorkTabContent> createState() => _WorkTabContentState();
}

class _WorkTabContentState extends State<WorkTabContent> {
  final List<Department> dep = [
    Department(id: 1, name: "John Doe"),
    Department(id: 2, name: "Emma Granger"),
    Department(id: 3, name: "Michael Williams"),
  ];

  final List<Manager> manager = [
    Manager(id: 1, name: "John Doe"),
    Manager(id: 2, name: "Emma Granger"),
    Manager(id: 3, name: "Michael Williams"),
  ];

  final List<JobPosition> jobPosition = [
    JobPosition(id: 1, name: "John Doe"),
    JobPosition(id: 2, name: "Emma Granger"),
    JobPosition(id: 3, name: "Michael Williams"),
  ];

  final List<WorkLocation> workLocation = [
    WorkLocation(id: 1, name: "Office"),
    WorkLocation(id: 2, name: "Home"),
    WorkLocation(id: 3, name: "Remote"),
  ];

  Department? selectDepartment;
  Manager? selectedManager;
  JobPosition? selectedPostion;
  WorkLocation? selectedWorkLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // work section
        workSection(),

        SizedBox(height: AppSpacing.lg),

        // location section
        locationSection(),
        SizedBox(height: AppSpacing.lg),
        // usuall work location
        usuallWorkLocation(),
      ],
    );
  }

  Column usuallWorkLocation() {
    const double labelWidth = 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Usuall work location",
          style: TextStyle(
            fontSize: AppTextSize.bodyDesktop,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),

        // monday
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Monday"),
            SizedBox(width: 8),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<WorkLocation>(
                    items: workLocation,
                    labelBuilder: (m) => m.name,

                    onSelected: (value) =>
                        setState(() => selectedWorkLocation = value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // tuesday
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Tuesday"),
            SizedBox(width: 8),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<WorkLocation>(
                    items: workLocation,
                    labelBuilder: (m) => m.name,

                    onSelected: (value) =>
                        setState(() => selectedWorkLocation = value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // wednesday
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Wednesday"),
            SizedBox(width: 8),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<WorkLocation>(
                    items: workLocation,
                    labelBuilder: (m) => m.name,

                    onSelected: (value) =>
                        setState(() => selectedWorkLocation = value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // thursday
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Thursday"),
            SizedBox(width: 8),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<WorkLocation>(
                    items: workLocation,
                    labelBuilder: (m) => m.name,

                    onSelected: (value) =>
                        setState(() => selectedWorkLocation = value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // friday
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Friday"),
            SizedBox(width: 8),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<WorkLocation>(
                    items: workLocation,
                    labelBuilder: (m) => m.name,

                    onSelected: (value) =>
                        setState(() => selectedWorkLocation = value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // saturday
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Saturday"),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<WorkLocation>(
                    items: workLocation,
                    labelBuilder: (m) => m.name,

                    onSelected: (value) =>
                        setState(() => selectedWorkLocation = value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // sunday
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Sunday"),
            SizedBox(width: 8),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<WorkLocation>(
                    items: workLocation,
                    labelBuilder: (m) => m.name,

                    onSelected: (value) =>
                        setState(() => selectedWorkLocation = value),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column locationSection() {
    const double labelWidth =
        130; // ✅ one shared constant for this whole section

    return Column(
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
        SizedBox(height: AppSpacing.sm),
        // Work Address
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Work Address"),
            const SizedBox(width: 8),
            Flexible(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<Department>(
                    items: dep,
                    labelBuilder: (m) => m.name,
                    onSelected: (value) =>
                        setState(() => selectDepartment = value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),

        // Work Location
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Work Location"),
            const SizedBox(width: 8),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<JobPosition>(
                    items: jobPosition,
                    labelBuilder: (m) => m.name,
                    onSelected: (value) =>
                        setState(() => selectedPostion = value),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column workSection() {
    const double labelWidth = 130;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // work field
        Text(
          "Work",
          style: TextStyle(
            fontSize: AppTextSize.bodyDesktop,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),

        // department Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Department"),
            SizedBox(width: AppSpacing.lg),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<Department>(
                    items: dep,
                    labelBuilder: (m) => m.name,
                    onSelected: (value) =>
                        setState(() => selectDepartment = value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // Job Postion Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Job"),
            SizedBox(width: AppSpacing.lg),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<JobPosition>(
                    items: jobPosition,
                    labelBuilder: (m) => m.name,

                    onSelected: (value) =>
                        setState(() => selectedPostion = value),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Job Title"),
            SizedBox(width: AppSpacing.lg),

            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return CustomFormField(enableBorder: false);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // manager section
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(labelWidth: labelWidth, text: "Manager"),
            SizedBox(width: AppSpacing.lg),
            // department
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchableDropdownField<Department>(
                    items: dep,
                    labelBuilder: (m) => m.name,

                    onSelected: (value) =>
                        setState(() => selectDepartment = value),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
