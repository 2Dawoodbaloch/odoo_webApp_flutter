
import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/navbar/right_section_nav.dart';
import 'package:flutter_odoo/comm/widgets/navbar/searchbar_field.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
     this.title,
    this.icon,
    this.actions = const [],
    this.showSearchBar = true,
  });

  final String? title;
  final IconData? icon;

  /// Buttons or widgets shown before title
  final List<Widget> actions;

  final bool showSearchBar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: Row(
            children: [

              ...actions,

              if (actions.isNotEmpty)
                const SizedBox(width: 16),

              Text(
                title ?? "Dashboard",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),

              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(icon),
              ],
            ],
          ),
        ),

        if (showSearchBar)
          const SearchBarfield(),

        const RightSectionNav(),
      ],
    );
  }
}