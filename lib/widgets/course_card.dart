import 'package:flutter/material.dart';

import '../models/local_course.dart';
import '../theme/app_colors.dart';
import 'data_badge.dart';
import 'info_pill.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
    required this.onTap,
    this.recommendationLabel,
    this.recommendationDescription,
  });

  final LocalCourse course;
  final VoidCallback onTap;
  final String? recommendationLabel;
  final String? recommendationDescription;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      elevation: 0,
      borderRadius: BorderRadius.circular(26),
      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.deepBlue.withValues(alpha: 0.06),
                blurRadius: 24,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (recommendationLabel != null) ...[
                          DataBadge(
                            label: recommendationLabel!,
                            icon: Icons.tune_rounded,
                          ),
                          const SizedBox(height: 10),
                        ],
                        Text(
                          course.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w900,
                                height: 1.22,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  DataBadge(
                    label: '${course.switchScore}점',
                    icon: Icons.auto_graph_rounded,
                    backgroundColor: AppColors.deepBlue,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 9),
              Text(
                course.summary,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  height: 1.42,
                ),
              ),
              const SizedBox(height: 13),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  InfoPill(
                    icon: Icons.schedule_rounded,
                    label: course.duration,
                  ),
                  InfoPill(icon: Icons.near_me_rounded, label: course.distance),
                  InfoPill(
                    icon: Icons.wb_twilight_rounded,
                    label: course.recommendedTime,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: [
                  for (final tag in course.tags)
                    DataBadge(
                      label: tag,
                      backgroundColor: AppColors.paleBlue,
                      foregroundColor: const Color(0xFF075985),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.paleBlue,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  recommendationDescription ?? course.reason,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    height: 1.38,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text(
                    '코스 자세히 보기',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 19,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
