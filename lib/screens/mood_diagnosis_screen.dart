import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/data_badge.dart';
import 'home_screen.dart';

class MoodDiagnosisScreen extends StatefulWidget {
  const MoodDiagnosisScreen({super.key});

  @override
  State<MoodDiagnosisScreen> createState() => _MoodDiagnosisScreenState();
}

class _MoodDiagnosisScreenState extends State<MoodDiagnosisScreen> {
  final Set<String> _selectedMoodTags = {};

  static const _questions = [
    ('오늘은 바다를 오래 보고 싶나요?', '바다산책', Icons.waves_rounded),
    ('시장 먹거리와 상권을 둘러보고 싶나요?', '시장먹거리', Icons.storefront_rounded),
    ('오래된 골목이나 노포 분위기가 끌리나요?', '노포감성', Icons.store_mall_directory_rounded),
    ('저녁이나 야경 산책 코스가 좋나요?', '야경산책', Icons.nights_stay_rounded),
    ('유명 관광지보다 로컬 생활권을 더 깊게 보고 싶나요?', '로컬중심', Icons.explore_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
          children: [
            const _DiagnosisHero(),
            const SizedBox(height: 20),
            for (final question in _questions) ...[
              _MoodQuestionCard(
                question: question.$1,
                tag: question.$2,
                icon: question.$3,
                selected: _selectedMoodTags.contains(question.$2),
                onTap: () => _toggleTag(question.$2),
              ),
              const SizedBox(height: 10),
            ],
            if (_selectedMoodTags.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final tag in _selectedMoodTags)
                    DataBadge(
                      label: tag,
                      icon: Icons.check_rounded,
                      backgroundColor: AppColors.paleBlue,
                      foregroundColor: AppColors.deepBlue,
                    ),
                ],
              ),
            ],
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _startWithMood,
              icon: const Icon(Icons.arrow_forward_rounded),
              label: const Text('내 취향으로 시작하기'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(onPressed: _skip, child: const Text('건너뛰고 시작하기')),
          ],
        ),
      ),
    );
  }

  void _toggleTag(String tag) {
    setState(() {
      if (_selectedMoodTags.contains(tag)) {
        _selectedMoodTags.remove(tag);
      } else {
        _selectedMoodTags.add(tag);
      }
    });
  }

  void _startWithMood() {
    _openHome(_selectedMoodTags.toList());
  }

  void _skip() {
    _openHome(const []);
  }

  void _openHome(List<String> selectedMoodTags) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => HomeScreen(selectedMoodTags: selectedMoodTags),
      ),
    );
  }
}

class _DiagnosisHero extends StatelessWidget {
  const _DiagnosisHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [AppColors.deepBlue, AppColors.primary, AppColors.secondary],
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '나그네',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
          SizedBox(height: 8),
          DataBadge(
            label: 'Local Switch Pohang',
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primary,
          ),
          SizedBox(height: 24),
          Text(
            '오늘의 포항 여행 감성을 골라볼까요?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '5개의 선택으로 바다·시장·노포·야경·로컬 취향을 반영해요.',
            style: TextStyle(color: Colors.white70, height: 1.45),
          ),
        ],
      ),
    );
  }
}

class _MoodQuestionCard extends StatelessWidget {
  const _MoodQuestionCard({
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
    return Material(
      color: selected ? AppColors.softBlue : AppColors.card,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: selected ? AppColors.primary : AppColors.textSecondary,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  question,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                    height: 1.35,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              DataBadge(
                label: tag,
                backgroundColor: selected
                    ? AppColors.primary
                    : AppColors.paleBlue,
                foregroundColor: selected ? Colors.white : AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
