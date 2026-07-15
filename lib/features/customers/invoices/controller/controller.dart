import 'package:flutter_odoo/features/customers/invoices/model/invoice_entry.dart';
import 'package:get/get.dart';


class InvoiceEntriesController extends GetxController {
  final entries = <InvoiceEntry>[].obs;

  void addEntry(InvoiceEntry entry) {
    entries.add(entry);
  }
}