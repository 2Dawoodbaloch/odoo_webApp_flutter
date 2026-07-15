import 'package:flutter_odoo/features/accounting/view/journal_entries/model/journal_entry.dart';
import 'package:get/get.dart';


class JournalEntriesController extends GetxController {
  final entries = <JournalEntry>[].obs;

  void addEntry(JournalEntry entry) {
    entries.add(entry);
  }
}