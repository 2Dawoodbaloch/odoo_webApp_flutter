import 'package:flutter_odoo/features/accounting/view/journal_entries/controller/journal_entries_controller.dart';
import 'package:get/get.dart';

class JournalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JournalEntriesController>(
      () => JournalEntriesController(),
    );
  }
}