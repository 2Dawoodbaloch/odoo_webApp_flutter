import 'dart:ui';

import 'package:flutter/material.dart';

class CompactTile extends StatelessWidget {
  const CompactTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 20, color: Colors.grey.shade700),
            const SizedBox(width: 8),
          ],
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 10, ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
            ],
          ),
        ],
      ),
    );
  }
}