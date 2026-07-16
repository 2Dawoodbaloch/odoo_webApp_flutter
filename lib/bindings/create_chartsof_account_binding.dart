import 'package:flutter_odoo/features/charts_of_accounts/view/create_charts_of_accounts/controller/create_chart_Of_accounts_controller.dart';
import 'package:get/get.dart';

class CreateChartsofAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateChartOfAccountsController>(
      () => CreateChartOfAccountsController(),
    );
  }
}