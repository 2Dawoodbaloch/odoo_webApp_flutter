class  PaymentTerms{
  final int id;
  final String name;

  const PaymentTerms({
    required this.id,
    required this.name,
  });

  factory PaymentTerms.fromJson(Map<String, dynamic> json) {
    return PaymentTerms(
      id: json['id'],
      name: json['name'],
    );
  }
}