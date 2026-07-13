import 'package:flutter_odoo/features/accounting/view/journal_entries/controller/journal_entries_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(JournalEntriesController(), permanent: true); // ✅ lives for the whole app session
  }
}