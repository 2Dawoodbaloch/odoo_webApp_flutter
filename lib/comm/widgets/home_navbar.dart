import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/comm/model/navbar/accounting_menus.dart';
import 'package:flutter_odoo/comm/model/navbar/nav_menu_button.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:flutter_odoo/utils/constants/responsiveness/responsiveness.dart';
import 'package:flutter_odoo/utils/constants/responsiveness/responsiveness_extention.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  // final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.screenType == AppScreenType.mobile;

    if (isMobile) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              const Text(
                "Accounting",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _RightSectionNavBar(), 
        ],
      );
    }

    // left section
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                Icon(Icons.logo_dev, color: Colors.red),
                SizedBox(width: AppSpacing.spaceBtwInputFields),
                TextWidget(
                  text: "Accounting",
                  fontWeight: FontWeight.bold,
                  fontSize: AppTextSize.titleDesktop,
                ),
              ],
            ),
            SizedBox(width: AppSpacing.md),
            Row(
              children: [
                for (final nav in AccountingMenus.menus)
                  NavMenuButton(
                    label: nav.label,
                    sections: nav.sections,
                    onTap: nav.route != null
                        ? () => Navigator.pushNamed(context, nav.route!)
                        : null,
                    onItemSelected: (item) {
                      final selected = nav.sections
                          .expand((s) => s.items)
                          .firstWhere((i) => i.label == item);
                      if (selected.route != null) {
                        Navigator.pushNamed(context, selected.route!);
                      }
                    },
                  ),
              ],
            ),
          ],
        ),

        // Right section Section nav
        _RightSectionNavBar(),
      ],
    );
  }
}

class _RightSectionNavBar extends StatelessWidget {
  const _RightSectionNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(text: "Raptor Eye"),
        SizedBox(width: AppSpacing.xs),
        CustomButton(title: "M", backgroundColor: APPColors.btnSky),
      ],
    );
  }
}
