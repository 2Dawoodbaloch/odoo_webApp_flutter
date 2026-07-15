class  CompanyBank{
  final int id;
  final String name;

  const CompanyBank({
    required this.id,
    required this.name,
  });

  factory CompanyBank.fromJson(Map<String, dynamic> json) {
    return CompanyBank(
      id: json['id'],
      name: json['name'],
    );
  }
}