import 'package:get/get.dart';

class InvoiceEntry {
  InvoiceEntry({
    required this.number,
    required this.customer,
    required this.invoiceDate,
    required this.dueDate,
    required this.tax,
    required this.total,
    required this.amount,
  });

  final String number;
  final String customer;
  final String invoiceDate;
  final String dueDate;
  final String tax;
  final double total;
  final String amount;
}

class InvoiceEntriesController extends GetxController {
  final entries = <InvoiceEntry>[].obs;

  void addEntry(InvoiceEntry entry) {
    entries.add(entry);
  }
}