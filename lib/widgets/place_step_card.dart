import 'package:flutter/material.dart';

import '../models/course_place.dart';
import '../theme/app_colors.dart';
import 'data_badge.dart';

class PlaceStepCard extends StatelessWidget {
  const PlaceStepCard({
    super.key,
    required this.place,
    required this.stepNumber,
  });

  final CoursePlace place;
  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepBlue.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 19,
                backgroundColor: AppColors.deepBlue,
                foregroundColor: Colors.white,
                child: Text(
                  '$stepNumber',
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 10),
              Icon(
                _iconForType(place.type),
                color: AppColors.secondary,
                size: 22,
              ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        place.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    DataBadge(label: place.type),
                  ],
                ),
                const SizedBox(height: 9),
                Text(
                  place.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                DataBadge(
                  label: '추천 체류 ${place.stayTime}',
                  icon: Icons.timer_outlined,
                  backgroundColor: AppColors.paleBlue,
                  foregroundColor: AppColors.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForType(String type) {
    if (type.contains('대표관광지')) {
      return Icons.place_rounded;
    }
    if (type.contains('시장') || type.contains('상권')) {
      return Icons.storefront_rounded;
    }
    if (type.contains('항구')) {
      return Icons.directions_boat_rounded;
    }
    if (type.contains('산책') || type.contains('해변')) {
      return Icons.directions_walk_rounded;
    }
    if (type.contains('카페')) {
      return Icons.local_cafe_rounded;
    }
    if (type.contains('문화')) {
      return Icons.museum_rounded;
    }
    if (type.contains('식당')) {
      return Icons.restaurant_rounded;
    }
    return Icons.location_on_rounded;
  }
}
