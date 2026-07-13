class  JournalModel{
  final int id;
  final String name;

  const JournalModel({
    required this.id,
    required this.name,
  });

  factory JournalModel.fromJson(Map<String, dynamic> json) {
    return JournalModel(
      id: json['id'],
      name: json['name'],
    );
  }
}