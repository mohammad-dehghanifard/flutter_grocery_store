import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:flutter_grocery_store/modules/profile/pages/order_history_page.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PaymentResultPage extends StatelessWidget {
  const PaymentResultPage({super.key, required this.type, required this.id});
  final String type;
  final String id;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 542,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
              children: [
                Icon(Iconsax.tick_square,size: 80,color: type == "success"? const Color(0xFF1CAE00) :const Color(0xFFFF3D51)),
                const SizedBox(height: 20),
                Text(
                  type == "success"? "پرداخت با موفقیت انجام شد":"پرداخت موفق نبود",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color:type == "success"? const Color(0xFF1CAE00) :const Color(0xFFFF3D51) ),
                ),
                const Spacer(),
                const Text("کد رهگیری",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xFF9A9A9A)),),
                Text(id,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
                const Spacer(),
                ButtonWidget(
                  onPress: () => Get.off(const OrderHistoryPage()),
                  text: "لیست سفارشات",
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
