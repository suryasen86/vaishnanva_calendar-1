import 'package:flutter/material.dart';

class AppColors {
  final Color primaryColor;
  final Color backgroundColor;
  final Color appBarColor;


  AppColors({
    required this.primaryColor,
    required this.appBarColor,
    required this.backgroundColor,
  });

  static final lightMode = AppColors(
    primaryColor: const Color(0xFF2E7DE0),
    appBarColor: const Color(0xFFF47B20),
    backgroundColor: const Color(0xFFFFFFFF),
  );
  static final darkMode = AppColors(
    primaryColor: const Color(0xFF2E7DE0),
    appBarColor: const Color(0xFF001725),
    backgroundColor: const Color(0xFF001725),
  );
}
