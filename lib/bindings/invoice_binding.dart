import 'package:flutter_odoo/features/accounting/view/customers/invoices/view/create_new_invoice/controller/create_invoice_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class InvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateInvoiceController()); 
  }
}