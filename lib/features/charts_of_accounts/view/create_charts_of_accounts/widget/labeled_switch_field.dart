import 'package:flutter/material.dart';

class LabeledSwitchField extends StatelessWidget {
  const LabeledSwitchField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.labelWidth = 90,
    this.activeColor,
    this.scale = 0.8, // ✅ new — controls overall switch size
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final double labelWidth;
  final Color? activeColor;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: labelWidth,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        Transform.scale(
          scale: scale,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor ?? Colors.white,
            activeTrackColor: Colors.green.shade600,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}