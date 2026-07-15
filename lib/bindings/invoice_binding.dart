import 'package:flutter_odoo/features/customers/invoices/controller/controller.dart';
import 'package:get/get.dart';

class InvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceEntriesController>(
      () => InvoiceEntriesController(),
    );
  }
}