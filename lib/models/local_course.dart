import 'course_place.dart';

class LocalCourse {
  const LocalCourse({
    required this.id,
    required this.spotId,
    required this.title,
    required this.summary,
    required this.duration,
    required this.distance,
    required this.recommendedTime,
    required this.switchScore,
    required this.tags,
    required this.reason,
    required this.congestionReliefScore,
    required this.localBusinessScore,
    required this.walkingScore,
    required this.stayExtensionScore,
    required this.dispersionScore,
    required this.places,
  });

  factory LocalCourse.fromJson(Map<String, Object?> json) {
    final tags = json['tags'] as List<Object?>;
    final places = json['places'] as List<Object?>;

    return LocalCourse(
      id: json['id'] as String,
      spotId: json['spotId'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      duration: json['duration'] as String,
      distance: json['distance'] as String,
      recommendedTime: json['recommendedTime'] as String,
      switchScore: json['switchScore'] as int,
      tags: tags.cast<String>(),
      reason: json['reason'] as String,
      congestionReliefScore: json['congestionReliefScore'] as int,
      localBusinessScore: json['localBusinessScore'] as int,
      walkingScore: json['walkingScore'] as int,
      stayExtensionScore: json['stayExtensionScore'] as int,
      dispersionScore: json['dispersionScore'] as int,
      places: places
          .cast<Map<String, Object?>>()
          .map(CoursePlace.fromJson)
          .toList(),
    );
  }

  final String id;
  final String spotId;
  final String title;
  final String summary;
  final String duration;
  final String distance;
  final String recommendedTime;
  final int switchScore;
  final List<String> tags;
  final String reason;
  final int congestionReliefScore;
  final int localBusinessScore;
  final int walkingScore;
  final int stayExtensionScore;
  final int dispersionScore;
  final List<CoursePlace> places;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'spotId': spotId,
      'title': title,
      'summary': summary,
      'duration': duration,
      'distance': distance,
      'recommendedTime': recommendedTime,
      'switchScore': switchScore,
      'tags': tags,
      'reason': reason,
      'congestionReliefScore': congestionReliefScore,
      'localBusinessScore': localBusinessScore,
      'walkingScore': walkingScore,
      'stayExtensionScore': stayExtensionScore,
      'dispersionScore': dispersionScore,
      'places': places.map((place) => place.toJson()).toList(),
    };
  }
}
