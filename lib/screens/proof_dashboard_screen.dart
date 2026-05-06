import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/data_badge.dart';
import '../widgets/section_title.dart';

class ProofDashboardScreen extends StatelessWidget {
  const ProofDashboardScreen({super.key});

  static const _funnels = [
    _FunnelArea(name: '스페이스워크·영일대 권역', values: [1280, 720, 420, 188, 142, 76]),
    _FunnelArea(name: '죽도시장·포항운하 권역', values: [980, 610, 388, 204, 166, 92]),
    _FunnelArea(name: '구룡포 일본인 가옥거리 권역', values: [760, 448, 284, 132, 108, 64]),
  ];

  static const _funnelLabels = [
    '추천 노출',
    '카드 클릭',
    '길찾기 전환',
    '저장·공유',
    '2차 탐색',
    '체크인',
  ];

  static const _candidateResponses = [
    ('대보항', 82),
    ('포항운하', 78),
    ('구룡포시장', 74),
    ('철길숲', 69),
  ];

  static const _protectionLogs = [
    '항만 작업구역 우회 안내 적용',
    '야간 소음 우려 구간 추천 제외',
    '주거 밀집 골목 대신 해안 산책로 연결',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Proof Dashboard')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          const _DashboardHero(),
          const SizedBox(height: 24),
          const SectionTitle(
            title: '권역별 전환 퍼널',
            subtitle: '추천 노출부터 선택형 체크인까지 전환 가능성을 mock 지표로 확인합니다.',
          ),
          const SizedBox(height: 14),
          for (final area in _funnels) ...[
            _FunnelCard(area: area, labels: _funnelLabels),
            const SizedBox(height: 14),
          ],
          const SizedBox(height: 14),
          const SectionTitle(title: '후보지별 반응'),
          const SizedBox(height: 14),
          _CandidateCard(items: _candidateResponses),
          const SizedBox(height: 24),
          const SectionTitle(title: '보호 기준 적용 이력'),
          const SizedBox(height: 14),
          _ProtectionLogCard(logs: _protectionLogs),
        ],
      ),
    );
  }
}

class _DashboardHero extends StatelessWidget {
  const _DashboardHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [AppColors.deepBlue, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataBadge(
            label: '운영 실증 mock',
            icon: Icons.verified_rounded,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primary,
          ),
          SizedBox(height: 16),
          Text(
            '전환 가능성을 검증하는 운영 지표',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              height: 1.18,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '권역별 추천 반응과 보호 기준 적용 이력을 시연용 mock 데이터로 보여줍니다.',
            style: TextStyle(color: Colors.white70, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _FunnelCard extends StatelessWidget {
  const _FunnelCard({required this.area, required this.labels});

  final _FunnelArea area;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    final maxValue = area.values.first;

    return _DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            area.name,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < labels.length; i++) ...[
            _BarRow(
              label: labels[i],
              value: area.values[i],
              ratio: area.values[i] / maxValue,
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _CandidateCard extends StatelessWidget {
  const _CandidateCard({required this.items});

  final List<(String, int)> items;

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      child: Column(
        children: [
          for (final item in items) ...[
            _BarRow(label: item.$1, value: item.$2, ratio: item.$2 / 100),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _ProtectionLogCard extends StatelessWidget {
  const _ProtectionLogCard({required this.logs});

  final List<String> logs;

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final log in logs) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.shield_rounded,
                  color: AppColors.success,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    log,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _BarRow extends StatelessWidget {
  const _BarRow({
    required this.label,
    required this.value,
    required this.ratio,
  });

  final String label;
  final int value;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    final safeRatio = ratio.clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              '$value',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  height: 9,
                  decoration: BoxDecoration(
                    color: AppColors.softBlue,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                Container(
                  width: constraints.maxWidth * safeRatio,
                  height: 9,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({required this.child});

  final Widget child;

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
      child: child,
    );
  }
}

class _FunnelArea {
  const _FunnelArea({required this.name, required this.values});

  final String name;
  final List<int> values;
}
