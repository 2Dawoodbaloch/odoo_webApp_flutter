import 'package:get/get.dart';
 class PaymentEntry{
 PaymentEntry({
    required this.number,
    required this.customer,
    required this.invoiceDate,
    required this.dueDate,
    required this.tax,
    required this.total,
  });

  final String number;
  final String customer;
  final String invoiceDate;
  final String dueDate;
  final String tax;
  final double total;
}
class PaymentController extends GetxController {
final entries = <PaymentEntry>[].obs;

  void addEntry(PaymentEntry entry) {
    entries.add(entry);
  }
}

