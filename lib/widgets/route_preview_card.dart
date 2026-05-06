import 'package:flutter/material.dart';

import '../models/local_course.dart';
import '../theme/app_colors.dart';

class RoutePreviewCard extends StatelessWidget {
  const RoutePreviewCard({super.key, required this.course});

  final LocalCourse course;

  @override
  Widget build(BuildContext context) {
    final places = course.places.take(5).toList();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [AppColors.deepBlue, AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepBlue.withValues(alpha: 0.16),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '동선 미리보기',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '대표 관광지에서 로컬 생활권으로 이어지는 전환 흐름',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white70, height: 1.35),
          ),
          const SizedBox(height: 18),
          if (places.isEmpty)
            const Text('표시할 장소가 없습니다.', style: TextStyle(color: Colors.white))
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 4),
              child: Row(
                children: [
                  for (var i = 0; i < places.length; i++) ...[
                    _RoutePoint(index: i + 1, name: places[i].name),
                    if (i != places.length - 1) const _RouteLine(),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _RoutePoint extends StatelessWidget {
  const _RoutePoint({required this.index, required this.name});

  final int index;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      child: Column(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primary,
            child: Text(
              '$index',
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _RouteLine extends StatelessWidget {
  const _RouteLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 2,
      margin: const EdgeInsets.only(bottom: 26),
      color: Colors.white.withValues(alpha: 0.5),
    );
  }
}
