import 'package:flutter_odoo/features/customers/invoices/controller/controller.dart';
import 'package:flutter_odoo/features/accounting/view/journal_entries/controller/journal_entries_controller.dart';
import 'package:flutter_odoo/features/customers/payments/controller/payment_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(JournalEntriesController(), permanent: true); 
    Get.put(InvoiceEntriesController(),permanent: true);
    Get.put(PaymentController(),permanent: true);

  }
}