import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/auth/widgets/login_or_register_card.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFF3F9FF),
      body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const Spacer(),
                // logo
                Image.asset("assets/images/logo.webp",height: 100),
                const Spacer(),
                //container
                const LoginOrRegisterCard()
              ],
            ),
          )
      ),
    );
  }
}


