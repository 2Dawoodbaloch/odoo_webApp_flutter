import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/features/accounting/model/accounting_menus.dart';
import 'package:flutter_odoo/features/accounting/model/nav_menu_button.dart';
import 'package:flutter_odoo/features/employee/create_new_empoyee/widgets/text_widget.dart';
import 'package:flutter_odoo/utils/constants/app_icon_size.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/app_text_size.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';

class AccountingNavBar extends StatelessWidget {
  const AccountingNavBar({super.key, });

  // final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                Icon(Icons.logo_dev, color: Colors.red),
                SizedBox(width: AppSpacing.sm),
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

        // Left Section
        Row(
          children: [
            // Container(
            //   height: 40,
            //   width: 40,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/logo.png"),
            //       fit: BoxFit.contain
            //     ),
            //   ),
            // ),
            
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.ac_unit_sharp,
                color: Colors.red,
                size: AppIconSize.md,
              ),
            ),
         
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.local_dining_outlined, size: AppIconSize.md,),
            ),
          
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.messenger_sharp, size: AppIconSize.md,),
            ),
          
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, size: AppIconSize.md,),
            ),
        
            TextWidget(text: "Raptor Eye"),
            SizedBox(width: AppSpacing.xs),
            CustomButton(title: "M", backgroundColor: APPColors.btnSky),
          ],
        ),
      ],
    );
  }
}
