import 'package:flutter/material.dart';

import '../models/course_place.dart';
import '../models/local_course.dart';
import '../models/tourist_spot.dart';
import '../widgets/section_title.dart';
import 'switch_complete_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({
    super.key,
    required this.spot,
    required this.course,
  });

  final TouristSpot spot;
  final LocalCourse course;

  static const _blue = Color(0xFF0077B6);
  static const _softBlue = Color(0xFFE3F2FD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(spot.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 112),
        children: [
          _CourseHeader(course: course),
          const SizedBox(height: 16),
          _QuickInfo(course: course),
          const SizedBox(height: 24),
          const SectionTitle(title: '추천 이유'),
          const SizedBox(height: 10),
          _ReasonCard(reason: course.reason),
          const SizedBox(height: 24),
          const SectionTitle(
            title: '데이터 기반 추천 근거',
            subtitle: '혼잡 완화, 로컬상권 연결, 보행 접근성을 함께 반영했습니다.',
          ),
          const SizedBox(height: 12),
          _MetricGrid(course: course),
          const SizedBox(height: 24),
          const SectionTitle(title: '방문 순서'),
          const SizedBox(height: 12),
          for (var i = 0; i < course.places.length; i++) ...[
            _PlaceStepTile(index: i + 1, place: course.places[i]),
            const SizedBox(height: 10),
          ],
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 10, 20, 16),
        child: FilledButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) =>
                    SwitchCompleteScreen(spot: spot, course: course),
              ),
            );
          },
          icon: const Icon(Icons.alt_route_rounded),
          label: const Text('이 코스로 전환하기'),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ),
    );
  }
}

class _CourseHeader extends StatelessWidget {
  const _CourseHeader({required this.course});

  final LocalCourse course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0077B6), Color(0xFF48CAE4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Local Switch 점수',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${course.switchScore}',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  '점',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            course.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            course.summary,
            style: const TextStyle(color: Colors.white, height: 1.42),
          ),
        ],
      ),
    );
  }
}

class _QuickInfo extends StatelessWidget {
  const _QuickInfo({required this.course});

  final LocalCourse course;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _InfoCard(
            icon: Icons.schedule_rounded,
            label: '소요시간',
            value: course.duration,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _InfoCard(
            icon: Icons.near_me_rounded,
            label: '거리',
            value: course.distance,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _InfoCard(
            icon: Icons.access_time_filled_rounded,
            label: '추천 시간',
            value: course.recommendedTime,
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 118),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: CourseDetailScreen._softBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: CourseDetailScreen._blue, size: 20),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w900, height: 1.25),
          ),
        ],
      ),
    );
  }
}

class _ReasonCard extends StatelessWidget {
  const _ReasonCard({required this.reason});

  final String reason;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: CourseDetailScreen._softBlue),
      ),
      child: Text(reason, style: const TextStyle(height: 1.5)),
    );
  }
}

class _MetricGrid extends StatelessWidget {
  const _MetricGrid({required this.course});

  final LocalCourse course;

  @override
  Widget build(BuildContext context) {
    final metrics = [
      ('혼잡 완화', course.congestionReliefScore),
      ('상권 연결', course.localBusinessScore),
      ('도보 접근', course.walkingScore),
      ('체류 확장', course.stayExtensionScore),
      ('분산 효과', course.dispersionScore),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final metric in metrics)
          _MetricTile(label: metric.$1, score: metric.$2),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.score});

  final String label;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: CourseDetailScreen._softBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$score',
            style: const TextStyle(
              color: CourseDetailScreen._blue,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _PlaceStepTile extends StatelessWidget {
  const _PlaceStepTile({required this.index, required this.place});

  final int index;
  final CoursePlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: CourseDetailScreen._softBlue),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 17,
            backgroundColor: CourseDetailScreen._blue,
            foregroundColor: Colors.white,
            child: Text(
              '$index',
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      place.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    _TypePill(label: place.type),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  place.description,
                  style: const TextStyle(color: Colors.black54, height: 1.4),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      size: 16,
                      color: CourseDetailScreen._blue,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      place.stayTime,
                      style: const TextStyle(
                        color: CourseDetailScreen._blue,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TypePill extends StatelessWidget {
  const _TypePill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: CourseDetailScreen._softBlue,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: CourseDetailScreen._blue,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
