import 'package:flutter/material.dart';

import '../models/local_course.dart';
import '../models/tourist_spot.dart';

class SwitchCompleteScreen extends StatelessWidget {
  const SwitchCompleteScreen({
    super.key,
    required this.spot,
    required this.course,
  });

  final TouristSpot spot;
  final LocalCourse course;

  static const _blue = Color(0xFF0077B6);
  static const _softBlue = Color(0xFFE3F2FD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 36, 24, 24),
          children: [
            const CircleAvatar(
              radius: 42,
              backgroundColor: _softBlue,
              foregroundColor: _blue,
              child: Icon(Icons.route_rounded, size: 42),
            ),
            const SizedBox(height: 24),
            Text(
              '로컬 동선이 시작됐어요',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),
            const Text(
              '대표 관광지에서 주변 로컬 생활권으로 여행이 이어집니다.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, height: 1.45),
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: _softBlue),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _SummaryRow(label: '출발 관광지', value: spot.name),
                  _SummaryRow(label: '예상 소요시간', value: course.duration),
                  _SummaryRow(label: '이동 거리', value: course.distance),
                ],
              ),
            ),
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('지도 연동은 추후 제공 예정입니다.')),
                );
              },
              icon: const Icon(Icons.map_rounded),
              label: const Text('지도 앱으로 이동하기'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              icon: const Icon(Icons.home_rounded),
              label: const Text('홈으로 돌아가기'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 92,
            child: Text(label, style: const TextStyle(color: Colors.black54)),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
