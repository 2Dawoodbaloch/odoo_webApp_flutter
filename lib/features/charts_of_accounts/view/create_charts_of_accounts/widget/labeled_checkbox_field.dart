import 'package:flutter/material.dart';

class LabeledCheckboxField extends StatelessWidget {
  const LabeledCheckboxField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.labelWidth = 130,
    this.showHelpIcon = false,
    this.onHelpTap,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final double labelWidth;
  final bool showHelpIcon;
  final VoidCallback? onHelpTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: labelWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              if (showHelpIcon) ...[
                const SizedBox(width: 10),
                InkWell(
                  onTap: onHelpTap,
                  child: Icon(Icons.help_outline, size: 14, color: Colors.blue.shade400),
                ),
              ],
            ],
          ),
        ),
        InkWell(
          onTap: () => onChanged(!value),
          child: Checkbox(
            value: value,
            onChanged: (v) => onChanged(v ?? false),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            side: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ],
    );
  }
}