import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/tourist_spot.dart';
import '../theme/app_colors.dart';
import '../widgets/data_badge.dart';
import '../widgets/section_title.dart';
import '../widgets/spot_card.dart';
import 'course_recommendation_screen.dart';
import 'proof_dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.selectedMoodTags = const []});

  final List<String> selectedMoodTags;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
          children: [
            const _HeroPanel(),
            const SizedBox(height: 16),
            const _OriginGeofenceCard(),
            const SizedBox(height: 16),
            _MoodTagSummary(selectedMoodTags: selectedMoodTags),
            const SizedBox(height: 16),
            const _MetricRow(),
            const SizedBox(height: 30),
            const SectionTitle(
              title: '현재 진입 거점을 선택하세요',
              subtitle: '대표 관광지에 도착한 순간을 기준으로 주변 로컬 생활권 전환 코스를 추천합니다.',
            ),
            const SizedBox(height: 16),
            for (final spot in touristSpots) ...[
              SpotCard(
                spot: spot,
                onTap: () => _openRecommendation(context, spot),
              ),
              const SizedBox(height: 14),
            ],
            const SizedBox(height: 10),
            const _ProofDashboardEntry(),
          ],
        ),
      ),
    );
  }

  void _openRecommendation(BuildContext context, TouristSpot spot) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CourseRecommendationScreen(
          spot: spot,
          selectedMoodTags: selectedMoodTags,
        ),
      ),
    );
  }
}

class _ProofDashboardEntry extends StatelessWidget {
  const _ProofDashboardEntry();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.bar_chart_rounded, color: AppColors.textSecondary),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '운영 지표 보기',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'MVP 실증용 전환 퍼널 Mock',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const ProofDashboardScreen(),
                ),
              );
            },
            child: const Text('열기'),
          ),
        ],
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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.waves_rounded, color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  '나그네',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const DataBadge(
            label: 'Local Switch Pohang',
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primary,
          ),
          const SizedBox(height: 26),
          Text(
            '대표 관광지 이후, 가까운 로컬 동선으로 여행을 이어보세요.',
            style: textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '현재 진입한 관광거점을 기준으로 주변 생활권 전환 코스를 추천해요.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.42,
            ),
          ),
          const SizedBox(height: 18),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              DataBadge(
                label: '관광 흐름 전환',
                icon: Icons.route_rounded,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
              ),
              DataBadge(
                label: '혼잡 분산',
                icon: Icons.groups_2_rounded,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OriginGeofenceCard extends StatelessWidget {
  const _OriginGeofenceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepBlue.withValues(alpha: 0.06),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: '현재 진입 거점',
            subtitle: '지금 위치한 대표 관광지를 선택하면 Origin Geofence가 활성화된 것처럼 추천을 시작해요.',
          ),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              DataBadge(
                label: 'Origin Geofence Mock',
                icon: Icons.my_location_rounded,
              ),
              DataBadge(label: '현위치 기반 추천 준비', icon: Icons.radar_rounded),
            ],
          ),
        ],
      ),
    );
  }
}

class _MoodTagSummary extends StatelessWidget {
  const _MoodTagSummary({required this.selectedMoodTags});

  final List<String> selectedMoodTags;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '오늘의 감성 태그',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          if (selectedMoodTags.isEmpty)
            const Text(
              '감성 진단을 건너뛰었어요. 관광지를 선택하면 기본 추천으로 시작해요.',
              style: TextStyle(color: AppColors.textSecondary, height: 1.4),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final tag in selectedMoodTags)
                  DataBadge(
                    label: tag,
                    icon: Icons.favorite_rounded,
                    backgroundColor: AppColors.paleBlue,
                    foregroundColor: AppColors.deepBlue,
                  ),
              ],
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
          child: _MetricCard(icon: Icons.hub_rounded, label: '혼잡 분산'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _MetricCard(icon: Icons.storefront_rounded, label: '상권 연결'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _MetricCard(icon: Icons.more_time_rounded, label: '체류 확장'),
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
      constraints: const BoxConstraints(minHeight: 94),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(height: 8),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
