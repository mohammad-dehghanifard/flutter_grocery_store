import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeHelper extends GetxController {
  ThemeData defaultThemeData = ThemeData(
      fontFamily: 'yekanBakh',
      primaryColor: const Color(0xFF14489E),
      primaryColorLight: const Color(0xFFED723F),
      scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      dividerColor: const Color(0xFFE1E1E1),
      hintColor: const Color(0xFFB4B4B4),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color:Color(0xFF3A3A3A))
      )
  );
}