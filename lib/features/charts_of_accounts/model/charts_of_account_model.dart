class ChartsOfAccountModel {
  ChartsOfAccountModel({
    required this.code,
    required this.name,
    required this.type,
    required this.paymentReconciliation,
  });

  final String code;
  final String name;
  final String type;
  final bool paymentReconciliation; // the toggle switch value

  factory ChartsOfAccountModel.fromJson(Map<String, dynamic> json) {
    return ChartsOfAccountModel(
      code: json['code'],
      name: json['name'],
      type: json['type'],
      paymentReconciliation: json['payment_reconciliation'] ?? false,
    );
  }
}