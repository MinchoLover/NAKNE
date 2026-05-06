import 'package:flutter/material.dart';

import '../models/local_course.dart';
import '../models/tourist_spot.dart';
import '../theme/app_colors.dart';
import '../widgets/data_badge.dart';
import '../widgets/info_pill.dart';
import '../widgets/place_step_card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(spot.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 116),
        children: [
          _CourseHeader(course: course),
          const SizedBox(height: 16),
          _QuickInfo(course: course),
          const SizedBox(height: 26),
          const SectionTitle(title: '추천 이유'),
          const SizedBox(height: 12),
          _ReasonCard(reason: course.reason),
          const SizedBox(height: 26),
          const SectionTitle(
            title: '데이터 기반 추천 근거',
            subtitle: '혼잡 완화, 로컬상권 연결, 보행 접근성을 함께 반영했습니다.',
          ),
          const SizedBox(height: 14),
          _MetricGrid(course: course),
          const SizedBox(height: 26),
          const SectionTitle(title: '방문 순서'),
          const SizedBox(height: 14),
          for (var i = 0; i < course.places.length; i++) ...[
            PlaceStepCard(place: course.places[i], stepNumber: i + 1),
            const SizedBox(height: 12),
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
            minimumSize: const Size.fromHeight(56),
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
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DataBadge(
            label: 'Local Switch 점수',
            icon: Icons.auto_graph_rounded,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primary,
          ),
          const SizedBox(height: 14),
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
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            course.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.22,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            course.summary,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
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
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        InfoPill(icon: Icons.schedule_rounded, label: course.duration),
        InfoPill(icon: Icons.near_me_rounded, label: course.distance),
        InfoPill(
          icon: Icons.access_time_filled_rounded,
          label: course.recommendedTime,
        ),
      ],
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
        color: AppColors.card,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Text(
        reason,
        style: const TextStyle(color: AppColors.textPrimary, height: 1.5),
      ),
    );
  }
}

class _MetricGrid extends StatelessWidget {
  const _MetricGrid({required this.course});

  final LocalCourse course;

  @override
  Widget build(BuildContext context) {
    final metrics = [
      ('혼잡도 완화', course.congestionReliefScore, Icons.groups_2_rounded),
      ('로컬상권 연결', course.localBusinessScore, Icons.storefront_rounded),
      ('도보 접근성', course.walkingScore, Icons.directions_walk_rounded),
      ('체류시간 증가', course.stayExtensionScore, Icons.more_time_rounded),
      ('관광지 분산', course.dispersionScore, Icons.hub_rounded),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final metric in metrics)
          _MetricTile(label: metric.$1, score: metric.$2, icon: metric.$3),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.label,
    required this.score,
    required this.icon,
  });

  final String label;
  final int score;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 142,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.secondary, size: 20),
          const SizedBox(height: 10),
          Text(
            '$score',
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
