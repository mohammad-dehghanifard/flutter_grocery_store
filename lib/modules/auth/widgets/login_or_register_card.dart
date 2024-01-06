import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/modules/auth/pages/login_page.dart';
import 'package:flutter_grocery_store/modules/auth/pages/register_page.dart';
import 'package:get/get.dart';

class LoginOrRegisterCard extends StatelessWidget {
  const LoginOrRegisterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0,-6)
            )
          ]
      ),
      child:  Column(
        children: [
          const Text('به فروشگاه ما خوش آمدید',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
          const SizedBox(height: 12),
          const Text('لطفا برای ادامه یکی از گزینه های زیر را انتخاب کنید',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal)),
          const SizedBox(height: 40),
          // Buttons
          Row(
            children: [
              Expanded(
                  child: ButtonWidget(
                    onPress: () => Get.to(const RegisterPage()),
                    text: "ثبت نام",
                  )
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: ButtonWidget(
                    onPress: () => Get.to(const LoginPage()),
                    text: "ورود",
                  )
              ),
            ],
          ),

        ],
      ),
    );
  }
}