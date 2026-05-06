class CoursePlace {
  const CoursePlace({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.stayTime,
  });

  factory CoursePlace.fromJson(Map<String, Object?> json) {
    return CoursePlace(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      stayTime: json['stayTime'] as String,
    );
  }

  final String id;
  final String name;
  final String type;
  final String description;
  final String stayTime;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'stayTime': stayTime,
    };
  }
}
