class  AccountModel{
  final int id;
  final String name;

  const AccountModel({
    required this.id,
    required this.name,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      name: json['name'],
    );
  }
}