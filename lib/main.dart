import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F766E)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
