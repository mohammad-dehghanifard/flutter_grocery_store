import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/theme_helper.dart';
import 'package:flutter_grocery_store/modules/auth/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ThemeHelper>(
      init: ThemeHelper(),
      builder: (controller) {
      return  GetMaterialApp(
        theme: controller.defaultThemeData,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("fa","IR"),
        ],
        locale: const Locale("fa","IR"),
        home: const SplashPage(),
      );
    },);
  }
}
