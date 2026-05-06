import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'screens/home_screen.dart';
import 'theme/app_colors.dart';

void main() {
  assert(() {
    validateDummyData();
    return true;
  }());

  runApp(const LocalSwitchPohangApp());
}

class LocalSwitchPohangApp extends StatelessWidget {
  const LocalSwitchPohangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '나그네',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
