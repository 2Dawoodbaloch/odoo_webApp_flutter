class  DefaultTaxesModel{
  final int id;
  final String name;

  const DefaultTaxesModel({
    required this.id,
    required this.name,
  });

  factory DefaultTaxesModel.fromJson(Map<String, dynamic> json) {
    return DefaultTaxesModel(
      id: json['id'],
      name: json['name'],
    );
  }
}