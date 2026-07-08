class Manager {
  final int id;
  final String name;

  const Manager({
    required this.id,
    required this.name,
  });

  factory Manager.fromJson(Map<String, dynamic> json) {
    return Manager(
      id: json['id'],
      name: json['name'],
    );
  }
}