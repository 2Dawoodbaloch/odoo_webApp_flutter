import 'package:flutter_odoo/features/charts_of_accounts/controller/chartsof_account_controller.dart';
import 'package:get/get.dart';

class ChartsOfAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartOfAccountsController>(
      () => ChartOfAccountsController(),
    );
  }
}