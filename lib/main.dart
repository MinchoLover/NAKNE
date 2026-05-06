import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'screens/home_screen.dart';

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
      title: 'Local Switch Pohang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0077B6)),
        scaffoldBackgroundColor: const Color(0xFFF5FAFF),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
