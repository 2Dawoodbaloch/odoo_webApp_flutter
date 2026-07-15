import 'package:flutter_odoo/features/customers/invoices/view/create_new_invoice/controller/create_invoice_controller.dart';
import 'package:get/get.dart';

class CreateInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateInvoiceController>(
      () => CreateInvoiceController(),
    );
  }
}