import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/auth/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // bg image
            Image.asset(
                "assets/images/background.webp",
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.45),
            ),
            // logo
            Center(child: Image.asset("assets/images/logo.webp",height: 100))
          ],
        ),
      ),
    );
  }
}
