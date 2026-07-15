import 'package:flutter_odoo/features/accounting/view/journal_entries/view/create_journal/controller/journal_controller.dart';
import 'package:get/get.dart';

class CreateJournalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateJournalEntriesController>(
      () => CreateJournalEntriesController(),
    );
  }
}