import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/text_field_widget.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25),
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

                const TextFieldWidget(
                  hintText: "شماره موبایل",
                  type: TextInputType.phone,
                  icon: Iconsax.call,
                ),
                const SizedBox(height: 20),
                const TextFieldWidget(
                  hintText: "رمزعبور",
                  type: TextInputType.visiblePassword,
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
