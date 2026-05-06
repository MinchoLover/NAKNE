import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'data_badge.dart';

class LocalBalanceSlider extends StatelessWidget {
  const LocalBalanceSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final mode = _modeFor(value);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepBlue.withValues(alpha: 0.08),
            blurRadius: 26,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '여행 스타일 밸런스',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w900,
                    height: 1.16,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              DataBadge(label: mode.label, icon: Icons.tune_rounded),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '대표 관광지를 가볍게 볼지, 시장·항구 생활권까지 깊게 들어갈지 조정해보세요.',
            style: TextStyle(color: AppColors.textSecondary, height: 1.42),
          ),
          const SizedBox(height: 18),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 8,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 11),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 22),
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: AppColors.softBlue,
              thumbColor: Colors.white,
              overlayColor: AppColors.primary.withValues(alpha: 0.12),
            ),
            child: Slider(
              value: value.clamp(0.0, 100.0),
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: onChanged,
            ),
          ),
          const Row(
            children: [
              Expanded(
                child: Text(
                  '관광지 중심',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '로컬 중심',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.paleBlue,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              mode.description,
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

  _BalanceMode _modeFor(double value) {
    if (value <= 30) {
      return const _BalanceMode(
        label: '관광지 중심',
        description: '대표 관광지 주변의 짧고 쉬운 동선을 우선 추천해요.',
      );
    }
    if (value <= 65) {
      return const _BalanceMode(
        label: '균형형',
        description: '관광지 편의성과 로컬 동선을 함께 고려해 추천해요.',
      );
    }
    return const _BalanceMode(
      label: '로컬 중심',
      description: '시장·항구·해안 생활권까지 이어지는 코스를 우선 추천해요.',
    );
  }
}

class _BalanceMode {
  const _BalanceMode({required this.label, required this.description});

  final String label;
  final String description;
}
