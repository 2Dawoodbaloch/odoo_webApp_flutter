import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/searchbar_field.dart';
import 'package:flutter_odoo/comm/widgets/custom_container.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/app_sizes.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';

class BreadcrumbBar extends StatelessWidget {
  const BreadcrumbBar({
    super.key,
    required this.title,
    this.icon,
    this.leftActions =
        const [], // ✅ renamed from `actions` for clarity — matches "left section"
    this.showSearchBar = true,
    this.rightSection, // ✅ new — caller supplies whatever right-side content this screen needs
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
