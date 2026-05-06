import 'package:flutter/material.dart';

import '../models/local_course.dart';
import '../models/tourist_spot.dart';
import '../theme/app_colors.dart';
import '../widgets/course_card.dart';
import '../widgets/data_badge.dart';
import '../widgets/local_balance_slider.dart';
import '../widgets/section_title.dart';
import 'course_detail_screen.dart';

class CourseRecommendationScreen extends StatefulWidget {
  const CourseRecommendationScreen({
    super.key,
    required this.spot,
    this.selectedMoodTags = const [],
  });

  final TouristSpot spot;
  final List<String> selectedMoodTags;

  @override
  State<CourseRecommendationScreen> createState() =>
      _CourseRecommendationScreenState();
}

class _CourseRecommendationScreenState
    extends State<CourseRecommendationScreen> {
  double _localBalance = 55.0;

  @override
  Widget build(BuildContext context) {
    final sortedCourses = _sortedCourses();

    return Scaffold(
      appBar: AppBar(title: Text(widget.spot.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          _SpotSummaryPanel(spot: widget.spot),
          const SizedBox(height: 16),
          _MoodTagPanel(selectedMoodTags: widget.selectedMoodTags),
          const SizedBox(height: 16),
          LocalBalanceSlider(
            value: _localBalance,
            onChanged: (value) {
              setState(() {
                _localBalance = value;
              });
            },
          ),
          const SizedBox(height: 18),
          _RecommendationNotice(text: _balanceRecommendationText()),
          const SizedBox(height: 26),
          SectionTitle(
            title: '${widget.spot.name} 전환 코스',
            subtitle: '현재 설정: ${_balanceModeLabel()} 기준으로 추천 순서를 조정했습니다.',
            trailing: DataBadge(label: '${widget.spot.courses.length}개 코스'),
          ),
          const SizedBox(height: 16),
          for (final course in sortedCourses) ...[
            CourseCard(
              course: course,
              recommendationLabel: '${_balanceModeLabel()} 추천',
              recommendationDescription: _courseRecommendationDescription(
                course,
              ),
              protectionLabel: '보호 기준 반영',
              onTap: () => _openDetail(context, course),
            ),
            const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }

  List<LocalCourse> _sortedCourses() {
    final courses = [...widget.spot.courses];
    courses.sort((a, b) {
      final aScore = _finalPreferenceScore(a);
      final bScore = _finalPreferenceScore(b);
      final scoreCompare = bScore.compareTo(aScore);
      if (scoreCompare != 0) {
        return scoreCompare;
      }
      return b.switchScore.compareTo(a.switchScore);
    });
    return courses;
  }

  String _balanceModeLabel() {
    if (_localBalance <= 30) {
      return '관광지 중심';
    }
    if (_localBalance <= 65) {
      return '균형형';
    }
    return '로컬 중심';
  }

  String _balanceRecommendationText() {
    final moodText = widget.selectedMoodTags.isEmpty
        ? ''
        : ' ${widget.selectedMoodTags.take(2).join('·')} 감성도 함께 반영했어요.';
    if (_localBalance <= 30) {
      return '짧은 이동과 쉬운 접근성을 기준으로 코스를 정렬했어요.$moodText';
    }
    if (_localBalance <= 65) {
      return '관광지 편의성과 로컬상권 연결성을 함께 고려했어요.$moodText';
    }
    return '시장·항구·생활권 연결성이 높은 코스를 우선 추천했어요.$moodText';
  }

  double _localPreferenceScore(LocalCourse course) {
    return (course.localBusinessScore +
            course.stayExtensionScore +
            course.dispersionScore) /
        3;
  }

  double _travelerPreferenceScore(LocalCourse course) {
    return (course.walkingScore + course.congestionReliefScore) / 2;
  }

  double _finalPreferenceScore(LocalCourse course) {
    final localWeight = _localBalance / 100;
    final travelerWeight = 1 - localWeight;
    return _localPreferenceScore(course) * localWeight +
        _travelerPreferenceScore(course) * travelerWeight;
  }

  String _courseRecommendationDescription(LocalCourse course) {
    final localScore = _localPreferenceScore(course).round();
    final travelerScore = _travelerPreferenceScore(course).round();

    if (_localBalance <= 30) {
      return '도보 접근성과 혼잡 완화 점수 $travelerScore점을 반영해 가볍게 전환하기 좋은 코스입니다.';
    }
    if (_localBalance <= 65) {
      return '여행자 편의 $travelerScore점과 로컬 연결 $localScore점을 함께 고려한 균형형 추천입니다.';
    }
    return '로컬상권·체류확장·분산 효과 평균 $localScore점으로 생활권 전환성이 높은 코스입니다.';
  }

  void _openDetail(BuildContext context, LocalCourse course) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CourseDetailScreen(spot: widget.spot, course: course),
      ),
    );
  }
}

class _MoodTagPanel extends StatelessWidget {
  const _MoodTagPanel({required this.selectedMoodTags});

  final List<String> selectedMoodTags;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(22),
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
              '감성 태그를 선택하면 추천 설명이 더 개인화돼요.',
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
            '${spot.name}에서 어디로 이어갈까요?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w900,
              height: 1.22,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '관광 흐름 분산, 도보 접근성, 로컬상권 연결성을 함께 계산해 다음 동선을 추천했어요.',
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

class _RecommendationNotice extends StatelessWidget {
  const _RecommendationNotice({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.softBlue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.auto_graph_rounded, color: AppColors.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.textPrimary,
                height: 1.4,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
