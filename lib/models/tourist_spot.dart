import 'local_course.dart';

class TouristSpot {
  const TouristSpot({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.statusBadge,
    required this.localSwitchCount,
    required this.courses,
  });

  factory TouristSpot.fromJson(Map<String, Object?> json) {
    final tags = json['tags'] as List<Object?>;
    final courses = json['courses'] as List<Object?>;

    return TouristSpot(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      tags: tags.cast<String>(),
      statusBadge: json['statusBadge'] as String,
      localSwitchCount: json['localSwitchCount'] as int,
      courses: courses
          .cast<Map<String, Object?>>()
          .map(LocalCourse.fromJson)
          .toList(),
    );
  }

  final String id;
  final String name;
  final String description;
  final List<String> tags;
  final String statusBadge;
  final int localSwitchCount;
  final List<LocalCourse> courses;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tags': tags,
      'statusBadge': statusBadge,
      'localSwitchCount': localSwitchCount,
      'courses': courses.map((course) => course.toJson()).toList(),
    };
  }
}
