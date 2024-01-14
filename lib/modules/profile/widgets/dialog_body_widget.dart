import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/constants.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/modules/auth/pages/start_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutDialogBodyWidget extends StatelessWidget {
  const LogOutDialogBodyWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("خروج از حساب",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor)),
              const SizedBox(height: 4),
              const Text("آیا از خروج حساب مطمینید؟",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ButtonWidget(
                      onPress: () => Get.back(),
                      hasBorder:  true,
                      text: "خیر")),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: ButtonWidget(
                      onPress: () {
                        // log out
                        SharedPreferences.getInstance().then((prefs) {
                          prefs.remove(tokenKey);
                          Get.offAll(const StartPage());
                        });
                      },
                      text: "بله")),
                ],
              )
            ],
          ),
        ));
  }
}
