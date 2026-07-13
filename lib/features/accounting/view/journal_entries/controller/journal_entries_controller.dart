import 'package:get/get.dart';

// This is the "box" holding one finished entry's data — plain, no GetX inside it
class JournalEntry {
  JournalEntry({
    required this.date,
    required this.number,
    required this.partner,
    required this.reference,
    required this.journal,
    required this.total,
    required this.status,
  });

  final DateTime date;
  final String number;
  final String partner;
  final String reference;
  final String journal;
  final double total;
  final String status;
}

class JournalEntriesController extends GetxController {
  final entries = <JournalEntry>[].obs;

  // Create screen calls this when "Post" is tapped
  void addEntry(JournalEntry entry) {
    entries.add(entry);
  }
}