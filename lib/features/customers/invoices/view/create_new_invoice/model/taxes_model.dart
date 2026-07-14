class  TaxModel{
  final int id;
  final String name;

  const TaxModel({
    required this.id,
    required this.name,
  });

  factory TaxModel.fromJson(Map<String, dynamic> json) {
    return TaxModel(
      id: json['id'],
      name: json['name'],
    );
  }
}