class PaymentModel {
  PaymentModel({
    required this.date,
    this.number,
    required this.journal,
    required this.customer,
    required this.amount,
    required this.status,
  });

  final DateTime date;
  final String? number; 
  final String journal;
  final String customer;
  final double amount;
  final String status; 
}