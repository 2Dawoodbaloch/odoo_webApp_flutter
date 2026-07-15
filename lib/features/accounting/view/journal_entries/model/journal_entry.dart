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