class  ParentAccountModel{
  final int id;
  final String name;

  const ParentAccountModel({
    required this.id,
    required this.name,
  });

  factory ParentAccountModel.fromJson(Map<String, dynamic> json) {
    return ParentAccountModel(
      id: json['id'],
      name: json['name'],
    );
  }
}