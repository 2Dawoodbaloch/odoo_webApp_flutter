import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/employee/view/widgets/sidebar/widget/department_tile.dart';

class DepartmentData {
  const DepartmentData(this.label, [this.count]);
  final String label;
  final int? count;
}

class DepartmentSidebar extends StatefulWidget {
  const DepartmentSidebar({
    super.key,
    required this.departments,
    this.onDepartmentSelected,
    this.onCollapseToggle,
  });

  final List<DepartmentData> departments;
  final ValueChanged<DepartmentData>? onDepartmentSelected;
  final VoidCallback? onCollapseToggle;

  @override
  State<DepartmentSidebar> createState() => _DepartmentSidebarState();
}

class _DepartmentSidebarState extends State<DepartmentSidebar> {
  late String _selectedLabel = widget.departments.first.label;

  void _select(DepartmentData department) {
    setState(() => _selectedLabel = department.label);
    widget.onDepartmentSelected?.call(department);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top: collapse toggle icon, right-aligned
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 10, bottom: 12),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.vertical_split, size: 20),
                tooltip: 'Collapse sidebar',
                onPressed: widget.onCollapseToggle,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
          ),

          Row(
            children: [
              const Icon(Icons.groups, size: 18, color: Colors.deepPurple),
              const SizedBox(width: 8),
              const Text(
                'DEPARTMENT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Department list
          for (final dept in widget.departments)
            DepartmentTile(
              label: dept.label,
              count: dept.count,
              selected: _selectedLabel == dept.label,
              onTap: () => _select(dept),
            ),
        ],
      ),
    );
  }
}
