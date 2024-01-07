import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/text_field_widget.dart';
import 'package:flutter_grocery_store/modules/auth/controller/register_controller.dart';
import 'package:flutter_grocery_store/modules/auth/pages/login_page.dart';
import 'package:get/get.dart';
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
            child: SingleChildScrollView(
              child: GetBuilder<RegisterController>(
                init: RegisterController(),
                builder: (controller) {
                  return Form(
                    key: controller.formKey,
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
                         TextFieldWidget(
                          validator: controller.validateFullName,
                          controller: controller.textControllerName,
                          hintText: "نام و نام خانوادگی",
                          type: TextInputType.text,
                          icon: Iconsax.user,
                        ),

                        const SizedBox(height: 15),
                        //mobile
                        TextFieldWidget(
                          validator: controller.validateMobileNumber,
                          controller: controller.textControllerMobile,
                          hintText: "شماره موبایل",
                          type: TextInputType.phone,
                          icon: Iconsax.mobile,
                        ),
                        const SizedBox(height: 15),
                        // password
                        TextFieldWidget(
                          validator: controller.validatePassword,
                          controller: controller.textControllerPassword,
                          hintText: "رمزعبور",
                          type: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 15),
                        // repeat pass
                        TextFieldWidget(
                          validator: controller.validateRepeatPassword,
                          controller: controller.textControllerRepeatPass,
                          hintText: "تکرار رمز عبور",
                          type: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 25),

                        // register button
                        ButtonWidget(
                            onPress: controller.register,
                            loading: controller.loading,
                            text: "ثبت نام"),
                        const SizedBox(height: 25),
                        // login btn
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("حساب کاربری دارید؟ ",style: TextStyle(color: Color(0xFF8C8C8C))),
                            const SizedBox(width: 5),
                            GestureDetector(
                                onTap: () => Get.off(const LoginPage()),
                                child: Text("وارد شوید",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold))),
                          ],
                        )


                      ],
                    ),
                  );
                },
              )
            ),
          ),
        ),
      )
    );
  }
}
