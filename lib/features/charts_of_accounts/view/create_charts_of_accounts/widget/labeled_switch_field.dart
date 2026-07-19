import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.scale = 0.8,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? Colors.white,
        activeTrackColor: Colors.green.shade600,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}