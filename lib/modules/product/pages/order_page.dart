import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(title: "تکمیل سفارش"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: const Text("آدرس خود را انتخاب کنید",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
