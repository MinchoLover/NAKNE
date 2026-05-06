import 'package:flutter/material.dart';

import '../models/local_course.dart';
import '../models/tourist_spot.dart';
import '../widgets/section_title.dart';
import 'course_detail_screen.dart';

class CourseRecommendationScreen extends StatelessWidget {
  const CourseRecommendationScreen({super.key, required this.spot});

  final TouristSpot spot;

  static const _blue = Color(0xFF0077B6);
  static const _softBlue = Color(0xFFE3F2FD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(spot.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: _softBlue),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Badge(label: spot.statusBadge),
                const SizedBox(height: 14),
                Text(
                  '근처 로컬 동선으로 전환해볼까요?',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '선택한 관광지 주변의 혼잡도 완화, 도보 접근성, 로컬상권 연결성을 기준으로 전환 코스를 추천했어요.',
                  style: TextStyle(color: Colors.black54, height: 1.45),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [for (final tag in spot.tags) _TagPill(label: tag)],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SectionTitle(
            title: '${spot.name} 전환 코스',
            subtitle: '대표 관광지에 머무는 흐름을 주변 생활권으로 이어주는 추천입니다.',
          ),
          const SizedBox(height: 14),
          for (final course in spot.courses) ...[
            _CourseCard(spot: spot, course: course),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({required this.spot, required this.course});

  final TouristSpot spot;
  final LocalCourse course;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => CourseDetailScreen(spot: spot, course: course),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      course.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  _ScoreBadge(score: course.switchScore),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                course.summary,
                style: const TextStyle(color: Colors.black54, height: 1.4),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _InfoPill(
                    icon: Icons.schedule_rounded,
                    label: course.duration,
                  ),
                  _InfoPill(
                    icon: Icons.near_me_rounded,
                    label: course.distance,
                  ),
                  _InfoPill(
                    icon: Icons.wb_twilight_rounded,
                    label: course.recommendedTime,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [for (final tag in course.tags) _TagPill(label: tag)],
              ),
              const SizedBox(height: 12),
              Text(
                course.reason,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(height: 1.4),
              ),
              const SizedBox(height: 14),
              const Row(
                children: [
                  Text(
                    '전환 추천',
                    style: TextStyle(
                      color: CourseRecommendationScreen._blue,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: CourseRecommendationScreen._blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreBadge extends StatelessWidget {
  const _ScoreBadge({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: CourseRecommendationScreen._blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            '$score',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Text(
            '점',
            style: TextStyle(color: Colors.white70, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: CourseRecommendationScreen._softBlue,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: CourseRecommendationScreen._blue),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: CourseRecommendationScreen._blue,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: CourseRecommendationScreen._softBlue,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: CourseRecommendationScreen._blue,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  const _TagPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      visualDensity: VisualDensity.compact,
      backgroundColor: const Color(0xFFF0F8FF),
      side: BorderSide.none,
      labelStyle: const TextStyle(
        color: Color(0xFF075985),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
