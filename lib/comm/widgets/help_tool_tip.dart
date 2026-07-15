import 'package:flutter/material.dart';

class HelpTooltip extends StatelessWidget {
  const HelpTooltip({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      waitDuration: const Duration(milliseconds: 300), // delay before showing on hover
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: const TextStyle(color: Colors.white, fontSize: 12),
      child: Icon(
        Icons.help_outline, // small "?" in a circle, matches your screenshot
        size: 14,
        color: Colors.blue.shade600,
      ),
    );
  }
}