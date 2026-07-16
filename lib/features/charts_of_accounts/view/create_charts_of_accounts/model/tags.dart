class  TagsModel{
  final int id;
  final String name;

  const TagsModel({
    required this.id,
    required this.name,
  });

  factory TagsModel.fromJson(Map<String, dynamic> json) {
    return TagsModel(
      id: json['id'],
      name: json['name'],
    );
  }
}