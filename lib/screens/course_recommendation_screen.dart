import 'package:flutter/material.dart';

import '../models/local_course.dart';
import '../models/tourist_spot.dart';
import '../theme/app_colors.dart';
import '../widgets/course_card.dart';
import '../widgets/data_badge.dart';
import '../widgets/section_title.dart';
import 'course_detail_screen.dart';

class CourseRecommendationScreen extends StatelessWidget {
  const CourseRecommendationScreen({super.key, required this.spot});

  final TouristSpot spot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(spot.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          _SpotSummaryPanel(spot: spot),
          const SizedBox(height: 26),
          SectionTitle(
            title: '${spot.name} 전환 코스',
            subtitle: '대표 관광지에 머무는 흐름을 주변 생활권으로 이어주는 추천입니다.',
            trailing: DataBadge(label: '${spot.courses.length}개 코스'),
          ),
          const SizedBox(height: 16),
          for (final course in spot.courses) ...[
            CourseCard(
              course: course,
              onTap: () => _openDetail(context, course),
            ),
            const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }

  void _openDetail(BuildContext context, LocalCourse course) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CourseDetailScreen(spot: spot, course: course),
      ),
    );
  }
}

class _SpotSummaryPanel extends StatelessWidget {
  const _SpotSummaryPanel({required this.spot});

  final TouristSpot spot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.07),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              DataBadge(label: spot.statusBadge, icon: Icons.radar_rounded),
              const DataBadge(label: '로컬 전환 분석'),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '근처 로컬 동선으로 전환해볼까요?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w900,
              height: 1.22,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '선택한 관광지 주변의 혼잡도 완화, 도보 접근성, 로컬상권 연결성을 기준으로 전환 코스를 추천했어요.',
            style: TextStyle(color: AppColors.textSecondary, height: 1.45),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tag in spot.tags)
                DataBadge(
                  label: tag,
                  backgroundColor: AppColors.paleBlue,
                  foregroundColor: const Color(0xFF075985),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
