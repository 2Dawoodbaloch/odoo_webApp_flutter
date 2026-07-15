import 'package:flutter/material.dart';

class CustomRadioOption<T> extends StatelessWidget {
  const CustomRadioOption({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeColor,
    this.labelStyle,
  });

  final String label;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Color? activeColor;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioGroup<T>(
              groupValue: groupValue,
              onChanged: onChanged,
              child: Radio<T>(
                value: value,
                activeColor: activeColor ?? Colors.teal,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: labelStyle ??
                  TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.black : Colors.grey.shade700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}