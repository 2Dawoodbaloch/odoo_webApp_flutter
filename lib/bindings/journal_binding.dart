import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/controller/journal_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class JournalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateJournalEntriesController()); 
  }
}