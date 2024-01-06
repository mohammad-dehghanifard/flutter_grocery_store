import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/text_field_widget.dart';
import 'package:flutter_grocery_store/modules/auth/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // logo and welcome text
                  Image.asset("assets/images/logo_horiz.png",height: 48),
                  const SizedBox(height: 10),
                  const Text("به فروشگاه آنلاین خودتون خوش اومدید",style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFF8C8C8C)
                  ),),
                  const SizedBox(height: 30),
                  // register form
                  const Align(
                      alignment: Alignment.topRight,
                      child: Text("ثبت نام",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                  // full name
                  const TextFieldWidget(
                    hintText: "شماره موبایل",
                    type: TextInputType.phone,
                    icon: Iconsax.mobile,
                  ),

                  const SizedBox(height: 15),
                  //mobile
                  const TextFieldWidget(
                    hintText: "رمزعبور",
                    type: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 25),


                  // register button
                  ButtonWidget(
                      onPress: () {},
                      text: "ورود"),
                  const SizedBox(height: 25),
                  // login btn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("حساب کاربری ندارید؟ ",style: TextStyle(color: Color(0xFF8C8C8C))),
                      const SizedBox(width: 5),
                      GestureDetector(
                          onTap: () => Get.off(const RegisterPage()),
                          child: Text("ثبت نام کنید",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold))),
                    ],
                  )


                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
