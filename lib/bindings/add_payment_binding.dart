import 'package:flutter_odoo/features/customers/payments/view/new_payment_screen/controller/add_payment_controller.dart';
import 'package:get/get.dart';

class AddPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPaymentController>(
      () => AddPaymentController(),
    );
  }
}