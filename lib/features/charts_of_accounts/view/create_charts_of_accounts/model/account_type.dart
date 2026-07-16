class  AccountTypeModel{
  final int id;
  final String name;

  const AccountTypeModel({
    required this.id,
    required this.name,
  });

  factory AccountTypeModel.fromJson(Map<String, dynamic> json) {
    return AccountTypeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}