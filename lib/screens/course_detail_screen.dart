import 'package:flutter/material.dart';

import '../models/local_course.dart';
import '../models/tourist_spot.dart';
import '../theme/app_colors.dart';
import '../widgets/data_badge.dart';
import '../widgets/info_pill.dart';
import '../widgets/place_step_card.dart';
import '../widgets/route_preview_card.dart';
import '../widgets/score_indicator.dart';
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
          RoutePreviewCard(course: course),
          const SizedBox(height: 16),
          _QuickInfo(course: course),
          const SizedBox(height: 26),
          const SectionTitle(title: '추천 이유'),
          const SizedBox(height: 12),
          _ReasonCard(reason: course.reason),
          const SizedBox(height: 26),
          const _LocalnessScoreCard(),
          const SizedBox(height: 26),
          const SectionTitle(
            title: '데이터 기반 추천 근거',
            subtitle: '혼잡 분산, 상권 연결, 체류 확장 가능성을 한눈에 확인하세요.',
          ),
          const SizedBox(height: 14),
          _ScoreList(course: course),
          const SizedBox(height: 26),
          const _ProtectionStandardCard(),
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

class _LocalnessScoreCard extends StatelessWidget {
  const _LocalnessScoreCard();

  static const _items = [
    ('P', '근접성', '현재 거점에서 이동 가능한 거리'),
    ('L', '생활권 장소성', '시장·항구·해안길 기반 장소'),
    ('A', '관광 집중 회피성', '대표 관광지 집중 흐름 분산'),
    ('S', '탐색 확장성', '주변 상권·POI 연결 가능성'),
    ('T', '취향 적합도', '감성 진단과 여행 스타일 반영'),
    ('E', '설명 가능성', '추천 이유를 이해할 수 있는 근거'),
    ('R', '보호성', '주민·어촌 생활권 보호 기준'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepBlue.withValues(alpha: 0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Localness Score',
            subtitle:
                '가까움, 생활권 장소성, 취향 적합도, 설명 가능성, 보호 기준을 함께 반영해 로컬 전환 적합도를 판단해요.',
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in _items)
                _LocalnessItem(
                  code: item.$1,
                  label: item.$2,
                  description: item.$3,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LocalnessItem extends StatelessWidget {
  const _LocalnessItem({
    required this.code,
    required this.label,
    required this.description,
  });

  final String code;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.paleBlue,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            child: Text(
              code,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProtectionStandardCard extends StatelessWidget {
  const _ProtectionStandardCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.paleBlue,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataBadge(label: '보호 기준 반영', icon: Icons.shield_rounded),
          SizedBox(height: 12),
          Text(
            '이 코스는 주거 밀집 골목, 항만 작업구역, 조업 동선, 야간 소음 우려 구간을 피하는 방향으로 설계됐어요.',
            style: TextStyle(color: AppColors.textPrimary, height: 1.45),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              DataBadge(label: '민감 POI 감산'),
              DataBadge(label: '야간 소음 구간 회피'),
              DataBadge(label: '항만·어촌 작업공간 보호'),
              DataBadge(label: '생활권 부담 최소화'),
            ],
          ),
        ],
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
            label: '전환 코스 상세',
            icon: Icons.alt_route_rounded,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primary,
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
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Local Switch 점수',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
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
              ],
            ),
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

class _ScoreList extends StatelessWidget {
  const _ScoreList({required this.course});

  final LocalCourse course;

  @override
  Widget build(BuildContext context) {
    final scores = [
      ('혼잡도 완화', course.congestionReliefScore, Icons.groups_2_rounded),
      ('로컬상권 연결', course.localBusinessScore, Icons.storefront_rounded),
      ('도보 접근성', course.walkingScore, Icons.directions_walk_rounded),
      ('체류시간 증가', course.stayExtensionScore, Icons.more_time_rounded),
      ('관광지 분산', course.dispersionScore, Icons.hub_rounded),
    ];

    return Column(
      children: [
        for (final score in scores) ...[
          ScoreIndicator(label: score.$1, score: score.$2, icon: score.$3),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
