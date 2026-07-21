import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/model/navbar/accounting_menus.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AppNavDrawer extends StatelessWidget {
  const AppNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          for (final nav in AccountingMenus.menus) 
            ExpansionTile( 
              title: Text(nav.label),
              children: [
                for (final section in nav.sections)
                  for (final item in section.items)
                    ListTile(
                      title: Text(item.label),
                      onTap: () {
                        Navigator.pop(context); // close drawer
                        if (item.route != null) Get.toNamed(item.route!);
                      },
                    ),
              ],
            ),
        ],
      ),
    );
  }
}