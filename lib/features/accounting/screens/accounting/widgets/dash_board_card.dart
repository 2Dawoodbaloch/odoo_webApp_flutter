import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.title,
    required this.description,
    required this.button,
    this.body,
    this.trailing,
  });

  final String title;
  final String description;
  final Widget button;
  final Widget? body;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              if (trailing != null) trailing!,
            ],
          ),

          const SizedBox(height: 8),

          Text(description),

          const SizedBox(height: 8),

          button,

          if (body != null) ...[
            const SizedBox(height: 8),
            body!,
          ],
        ],
      ),
    );
  }
}