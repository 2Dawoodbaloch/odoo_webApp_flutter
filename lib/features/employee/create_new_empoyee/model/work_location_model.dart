class WorkLocation {
  final int id;
  final String name;

  const WorkLocation({
    required this.id,
    required this.name,
  });

  factory WorkLocation.fromJson(Map<String, dynamic> json) {
    return WorkLocation(
      id: json['id'],
      name: json['name'],
    );
  }
}