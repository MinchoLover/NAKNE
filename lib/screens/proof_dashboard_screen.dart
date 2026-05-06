import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/data_badge.dart';
import '../widgets/section_title.dart';

class ProofDashboardScreen extends StatelessWidget {
  const ProofDashboardScreen({super.key});

  static const _funnels = [
    _FunnelArea(name: '스페이스워크·영일대 권역', values: [1280, 428, 186, 94, 57, 18]),
    _FunnelArea(name: '죽도시장·포항운하 권역', values: [1040, 396, 174, 108, 62, 24]),
    _FunnelArea(name: '구룡포 일본인 가옥거리 권역', values: [860, 312, 142, 76, 44, 16]),
  ];

  static const _funnelLabels = [
    '추천 노출',
    '카드 클릭',
    '길찾기 전환',
    '저장·공유',
    '2차 탐색',
    '체크인',
  ];

  static const _candidates = [
    ('포항운하 산책길', '죽도시장·포항운하', 38, 18, '2차 탐색 높음'),
    ('송도해수욕장', '죽도시장·포항운하', 32, 16, '저장 반응 우수'),
    ('구룡포시장', '구룡포', 36, 20, '시장 연결 강함'),
    ('과메기문화관', '구룡포', 29, 14, '문화공간 적합'),
    ('두호동 해안 카페거리', '영일대', 34, 17, '야간 추천 적합'),
  ];

  static const _protectionLogs = [
    ('항만 작업구역 인접 후보 감산', '항만·어촌 작업공간 보호', '감산'),
    ('주거 골목 야간 추천 제한', '야간 소음 우려 구간', '시간 제한'),
    ('조업 동선 우회 안내 적용', '어촌 생활권 보호', '우회'),
    ('민감 POI 후보 제외', '주민 생활권 부담 최소화', '제외'),
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
            subtitle: '추천 노출부터 길찾기·저장·2차 탐색까지 전환 가능성을 확인해요.',
          ),
          const SizedBox(height: 14),
          for (final area in _funnels) ...[
            _FunnelCard(area: area, labels: _funnelLabels),
            const SizedBox(height: 14),
          ],
          const SizedBox(height: 12),
          const SectionTitle(title: '후보지별 반응'),
          const SizedBox(height: 14),
          _CandidateCard(items: _candidates),
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
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              DataBadge(
                label: '운영자 Mock',
                icon: Icons.admin_panel_settings_rounded,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
              ),
              DataBadge(
                label: '앱 로그 기반 검증',
                icon: Icons.verified_rounded,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
              ),
            ],
          ),
          SizedBox(height: 18),
          Text(
            '전환 가능성을 검증하는 실증 화면',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              height: 1.18,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '추천 노출부터 길찾기·저장·2차 탐색까지 운영 관점의 mock 지표를 보여줍니다.',
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

  final List<(String, String, int, int, String)> items;

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      child: Column(
        children: [
          for (final item in items) ...[
            _CandidateRow(item: item),
            const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }
}

class _CandidateRow extends StatelessWidget {
  const _CandidateRow({required this.item});

  final (String, String, int, int, String) item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                item.$1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            DataBadge(label: item.$5),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          item.$2,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
        const SizedBox(height: 8),
        _BarRow(
          label: '카드 클릭률 ${item.$3}%',
          value: item.$3,
          ratio: item.$3 / 100,
        ),
        const SizedBox(height: 6),
        _BarRow(
          label: '길찾기 전환율 ${item.$4}%',
          value: item.$4,
          ratio: item.$4 / 100,
        ),
      ],
    );
  }
}

class _ProtectionLogCard extends StatelessWidget {
  const _ProtectionLogCard({required this.logs});

  final List<(String, String, String)> logs;

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      child: Column(
        children: [
          for (final log in logs) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.shield_rounded,
                  color: AppColors.success,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        log.$1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        log.$2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                DataBadge(label: log.$3),
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
