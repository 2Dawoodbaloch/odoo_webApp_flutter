import 'package:flutter_odoo/features/customers/payments/model/payment_model.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final paymentsEntries = <PaymentModel>[].obs;

  void addPayment(PaymentModel payment) {
    paymentsEntries.add(payment);
  }

  double get totalAmount =>
      paymentsEntries.fold(0.0, (sum, p) => sum + p.amount);
}