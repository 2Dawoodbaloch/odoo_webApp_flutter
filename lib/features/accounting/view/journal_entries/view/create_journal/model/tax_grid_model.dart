class TaxGridModel{
  final int id;
  final String name;

  const TaxGridModel({
    required this.id,
    required this.name,
  });

  factory TaxGridModel.fromJson(Map<String, dynamic> json) {
    return TaxGridModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

