class PartnerModel{
  final int id;
  final String name;

  const PartnerModel({
    required this.id,
    required this.name,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    return PartnerModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

