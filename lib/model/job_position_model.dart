class JobPosition {
  final int id;
  final String name;

  const JobPosition({
    required this.id,
    required this.name,
  });

  factory JobPosition.fromJson(Map<String, dynamic> json) {
    return JobPosition(
      id: json['id'],
      name: json['name'],
    );
  }
}