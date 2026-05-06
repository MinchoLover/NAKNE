import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/tourist_spot.dart';
import '../widgets/section_title.dart';
import 'course_recommendation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _blue = Color(0xFF0077B6);
  static const _lightBlue = Color(0xFFE3F2FD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const _HeroPanel(),
            const SizedBox(height: 16),
            const _TodayRecommendationCard(),
            const SizedBox(height: 16),
            const _MetricRow(),
            const SizedBox(height: 28),
            const SectionTitle(
              title: '지금 어디에 있나요?',
              subtitle: '현재 머무는 대표 관광지를 선택하면 주변 로컬 동선으로 이어지는 코스를 추천합니다.',
            ),
            const SizedBox(height: 14),
            for (final spot in touristSpots) ...[
              _SpotCard(spot: spot),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF0077B6), Color(0xFF00A6D6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              '나그네',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '대표 관광지에서 로컬 동선으로 여행을 이어보세요.',
            style: textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '관광객 흐름을 주변 시장·항구·해안 생활권으로 전환합니다.',
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _TodayRecommendationCard extends StatelessWidget {
  const _TodayRecommendationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: HomeScreen._lightBlue),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: HomeScreen._lightBlue,
            foregroundColor: HomeScreen._blue,
            child: Icon(Icons.insights_rounded),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '오늘의 로컬 전환 추천',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const _SmallBadge(label: '데이터 기반 추천'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '영일대 방문객이 많은 시간대예요. 죽도시장·포항운하 방향으로 전환을 추천해요.',
                  style: TextStyle(height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _MetricCard(icon: Icons.groups_2_rounded, label: '혼잡 분산'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _MetricCard(icon: Icons.storefront_rounded, label: '상권 연결'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _MetricCard(icon: Icons.schedule_rounded, label: '체류 확장'),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: HomeScreen._lightBlue),
      ),
      child: Column(
        children: [
          Icon(icon, color: HomeScreen._blue),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _SpotCard extends StatelessWidget {
  const _SpotCard({required this.spot});

  final TouristSpot spot;

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
              builder: (_) => CourseRecommendationScreen(spot: spot),
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
                      spot.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _SmallBadge(label: spot.statusBadge),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                spot.description,
                style: const TextStyle(color: Colors.black54, height: 1.42),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [for (final tag in spot.tags) _TagPill(label: tag)],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Icon(
                    Icons.alt_route_rounded,
                    color: HomeScreen._blue,
                    size: 19,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '로컬 전환 코스 ${spot.localSwitchCount}개',
                    style: const TextStyle(
                      color: HomeScreen._blue,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SmallBadge extends StatelessWidget {
  const _SmallBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: HomeScreen._lightBlue,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: HomeScreen._blue,
          fontSize: 12,
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
