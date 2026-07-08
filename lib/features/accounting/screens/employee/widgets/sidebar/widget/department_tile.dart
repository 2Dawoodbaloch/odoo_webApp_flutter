import 'package:flutter/material.dart';

class DepartmentTile extends StatelessWidget {
  const DepartmentTile({
    super.key,
    required this.label,
    this.count,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final int? count;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.teal.shade50 : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,right: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    color: selected ? Colors.teal.shade800 : Colors.black87,
                  ),
                ),
              ),
              if (count != null)
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}