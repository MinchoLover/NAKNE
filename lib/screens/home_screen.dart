import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/tourist_spot.dart';
import '../theme/app_colors.dart';
import '../widgets/data_badge.dart';
import '../widgets/section_title.dart';
import '../widgets/spot_card.dart';
import 'course_recommendation_screen.dart';
import 'proof_dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<String> _selectedMoodTags = {};

  List<String> get _selectedMoodTagsList => _selectedMoodTags.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
          children: [
            const _HeroPanel(),
            const SizedBox(height: 16),
            _MoodCheckCard(
              selectedTags: _selectedMoodTags,
              onToggle: _toggleMoodTag,
            ),
            const SizedBox(height: 16),
            const _TodayRecommendationCard(),
            const SizedBox(height: 16),
            const _MetricRow(),
            const SizedBox(height: 16),
            const _ProofDashboardEntry(),
            const SizedBox(height: 30),
            const SectionTitle(
              title: '지금 어디에 있나요?',
              subtitle: '현재 머무는 대표 관광지를 선택하면 주변 생활권으로 이어지는 전환 코스를 보여드려요.',
            ),
            const SizedBox(height: 16),
            for (final spot in touristSpots) ...[
              SpotCard(
                spot: spot,
                onTap: () => _openRecommendation(context, spot),
              ),
              const SizedBox(height: 14),
            ],
          ],
        ),
      ),
    );
  }

  void _toggleMoodTag(String tag) {
    setState(() {
      if (_selectedMoodTags.contains(tag)) {
        _selectedMoodTags.remove(tag);
      } else {
        _selectedMoodTags.add(tag);
      }
    });
  }

  void _openRecommendation(BuildContext context, TouristSpot spot) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CourseRecommendationScreen(
          spot: spot,
          selectedMoodTags: _selectedMoodTagsList,
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
            '대표 관광지에서 로컬 동선으로 여행을 이어보세요.',
            style: textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '관광객 흐름을 주변 시장·항구·해안 생활권으로 전환합니다.',
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

class _MoodCheckCard extends StatelessWidget {
  const _MoodCheckCard({required this.selectedTags, required this.onToggle});

  final Set<String> selectedTags;
  final ValueChanged<String> onToggle;

  static const _questions = [
    ('오늘은 바다를 오래 보고 싶나요?', '바다산책', Icons.waves_rounded),
    ('시장 먹거리와 상권을 둘러보고 싶나요?', '시장먹거리', Icons.storefront_rounded),
    ('오래된 골목·노포 분위기가 좋나요?', '노포감성', Icons.store_mall_directory_rounded),
    ('저녁이나 야경 산책 코스가 끌리나요?', '야경산책', Icons.nights_stay_rounded),
    ('로컬 생활권을 더 깊게 보고 싶나요?', '로컬중심', Icons.explore_rounded),
  ];

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
            title: '오늘의 여행 감성',
            subtitle: '5초만 선택하면 추천 화면에서 감성 태그로 반영돼요.',
          ),
          const SizedBox(height: 14),
          for (final question in _questions) ...[
            _MoodChoiceRow(
              question: question.$1,
              tag: question.$2,
              icon: question.$3,
              selected: selectedTags.contains(question.$2),
              onTap: () => onToggle(question.$2),
            ),
            const SizedBox(height: 8),
          ],
          if (selectedTags.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final tag in selectedTags)
                  DataBadge(
                    label: tag,
                    icon: Icons.check_rounded,
                    backgroundColor: AppColors.paleBlue,
                    foregroundColor: AppColors.deepBlue,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _MoodChoiceRow extends StatelessWidget {
  const _MoodChoiceRow({
    required this.question,
    required this.tag,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String question;
  final String tag;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.softBlue : AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? AppColors.primary : AppColors.textSecondary,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                question,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 8),
            DataBadge(
              label: tag,
              backgroundColor: selected ? AppColors.primary : AppColors.card,
              foregroundColor: selected ? Colors.white : AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProofDashboardEntry extends StatelessWidget {
  const _ProofDashboardEntry();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.deepBlue,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const ProofDashboardScreen(),
            ),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(18),
          child: Row(
            children: [
              Icon(Icons.bar_chart_rounded, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  '운영 지표 보기 · Proof Dashboard',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: Colors.white70),
            ],
          ),
        ),
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
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.07),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.softBlue,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.insights_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '오늘의 로컬 전환 추천',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DataBadge(label: '데이터 기반 추천'),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '영일대 방문 흐름이 집중되는 시간대예요. 죽도시장·포항운하 방향으로 로컬 전환을 추천합니다.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.42,
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
