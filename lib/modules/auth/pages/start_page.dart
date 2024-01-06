import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';

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
                Container(
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
                                onPress: () {},
                                text: "ثبت نام",
                              )
                          ),
                           const SizedBox(width: 20),
                          Expanded(
                              child: ButtonWidget(
                                onPress: () {},
                                text: "ورود",
                              )
                          ),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
