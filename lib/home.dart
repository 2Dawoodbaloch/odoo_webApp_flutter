import 'package:flutter/material.dart';
import 'package:flutter_odoo/comm/widgets/cutom_button.dart';
import 'package:flutter_odoo/routes/routes_name.dart';
import 'package:flutter_odoo/utils/constants/app_spacing.dart';
import 'package:flutter_odoo/utils/constants/colors.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Scaffold(
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: "Employee",
                  height: 100,
                  onPressed: () =>
                     Get.toNamed(RoutesName.employeeHome),
                  backgroundColor: Colors.greenAccent,
                ),
              ),
              SizedBox(width: AppSpacing.lg),
              Expanded(
                child: CustomButton(
                  title: "Accounting",
                  height: 100,
                  onPressed: () =>
                      Get.toNamed(RoutesName.accountingHome),
                  backgroundColor: APPColors.btnSky,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
