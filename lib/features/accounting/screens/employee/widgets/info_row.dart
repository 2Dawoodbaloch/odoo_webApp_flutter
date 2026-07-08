import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.deepPurple),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis, // ✅ matches "granger@mycompany.exam..."
              maxLines: 1,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}