
import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/BreadcrumbBar/bread_crumb_Bar.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/routes/routes_name.dart';
import 'package:flutter_odoo/utils/constants/app_button_size.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class InvoiceBreadCrumber extends StatelessWidget {
  const InvoiceBreadCrumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BreadcrumbBar(
      title: "Invoices",
      icon: Icons.settings,
      actions: [
        CustomButton(
          title: "New",
          onPressed: () {
            Get.toNamed(RoutesName.createInvoices);
          },
          backgroundColor: APPColors.btnPurple,
          padding: AppButtons.btnPaddingSymm,
          textColor: APPColors.white,
        ),
        const SizedBox(width: 8),
                  
        CustomButton(
          title: "Upload",
          onPressed: () {},
          backgroundColor: APPColors.btnGrey,
          padding: AppButtons.btnPaddingSymm,
          textColor: APPColors.black,
        )
      ],
    );
  }
}