import 'package:flutter/material.dart';
import 'package:flutter_odoo/features/accounting/view/customers/invoices/model/column_model.dart';

class ListViewHeader extends StatelessWidget {
  const ListViewHeader({
    super.key,
    required this.columns,
    this.showCheckbox = false,
    this.onSelectAllChanged,
    this.selectAllValue = false,
    this.trailingIcon,
    this.onTrailingIconTap,
  });

  final List<InvoiceHeaderModel> columns;
  final bool showCheckbox;
  final ValueChanged<bool?>? onSelectAllChanged;
  final bool selectAllValue;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          if (showCheckbox) ...[
            Checkbox(
              value: selectAllValue,
              onChanged: onSelectAllChanged,
              side: BorderSide(color: Colors.grey.shade400),
            ),
            const SizedBox(width: 8),
          ],

          for (final column in columns)
            Expanded(
              flex: column.flex,
              child: Align(
                alignment: column.alignment,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      column.label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    if (column.sortable) ...[
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ],
                ),
              ),
            ),

          if (trailingIcon != null)
            IconButton(
              icon: Icon(trailingIcon, size: 18),
              onPressed: onTrailingIconTap,
            ),
        ],
      ),
    );
  }
}
