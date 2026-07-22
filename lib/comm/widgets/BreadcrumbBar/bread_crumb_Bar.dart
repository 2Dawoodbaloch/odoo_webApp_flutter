import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/searchbar_field.dart';
import 'package:flutter_odoo/utils/constants/app_sizes.dart';

class BreadcrumbBar extends StatelessWidget {
  const BreadcrumbBar({
    super.key,
    required this.title,
    this.icon,
    this.leftActions = const [],
    this.showSearchBar = true,
    this.rightSection,
  });

  final String title;
  final IconData? icon;
  final List<Widget> leftActions;
  final bool showSearchBar;
  final Widget? rightSection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              ...leftActions,
              if (leftActions.isNotEmpty) const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (icon != null) ...[
                SizedBox(width: AppSizes.xs),
                Icon(icon, size: AppSizes.iconXs),
              ],
            ],
          ),
        ),

        // MIDDLE section — search bar (Image 1 only)
        if (showSearchBar) const SearchBarfield(),

        // RIGHT section
        Expanded(
          flex: 1,
          child: rightSection != null
              ? Align(alignment: Alignment.centerRight, child: rightSection!)
              : const SizedBox(),
        ),
      ],
    );
  }
}
