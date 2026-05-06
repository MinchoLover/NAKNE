import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ScoreIndicator extends StatelessWidget {
  const ScoreIndicator({
    super.key,
    required this.label,
    required this.score,
    this.icon,
  });

  final String label;
  final int score;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final normalizedScore = score.clamp(0, 100);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepBlue.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: AppColors.secondary, size: 20),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '$normalizedScore점',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: normalizedScore / 100,
              minHeight: 9,
              backgroundColor: AppColors.softBlue,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
