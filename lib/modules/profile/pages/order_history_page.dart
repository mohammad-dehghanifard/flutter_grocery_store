import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(title: "سفارشات"),
            Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFEBEBEB),width: 1),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF7B7B7B).withOpacity(0.09),
                            blurRadius: 14,offset: const Offset(0,1)
                        )
                      ]
                    ),
                    child:  Column(
                      children: [
                        // address and order id
                        const Row(
                          children: [
                            Text("ارسال سفارش به: ",style: TextStyle(color: Color(0xFF8C8C8C))),
                            Text("خانه",style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text("شماره سفارش: ",style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("12345678",style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // product list
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Container(
                                       margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                                       padding: const EdgeInsets.symmetric(horizontal: 6),
                                      decoration:  BoxDecoration(
                                        border: index != 0? const Border(right: BorderSide(color: Color(0xFFD4D4D4))): null
                                      ),
                                      child: Center(
                                        child: Image.network(
                                            "https://dl.hitaldev.com/ecommerce/category_images/400967.png",height: 40,
                                        ),
                                      ),
                                    ),
                                    // item count
                                    Container(
                                      width: 14,
                                      height: 14,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFCBE0FF)
                                      ),
                                      child: const Center(child: Text("2",style: TextStyle(fontSize: 9),)),
                                    )
                                  ],
                                );
                              },
                          ),
                        ),
                        const SizedBox(height: 4),
                        // order details
                         Row(
                          children: [
                            // item count
                            const Text("30",style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            const Text("قلم کالا",style: TextStyle(color: Color(0xFF8C8C8C),fontSize: 13)),
                            const Spacer(),
                            // price
                            const Text("قیمت سفارش",style: TextStyle(color: Color(0xFF8C8C8C),fontSize: 13)),
                            const SizedBox(width: 8),
                            const Text("۱۱,۰۰۰",style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            const Text("تومان",style: TextStyle(color: Color(0xFF8C8C8C),fontSize: 13)),
                            const Spacer(),
                            // order status
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              decoration:  BoxDecoration(
                                color: const Color(0xFF2AC066),
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: const Text("تحویل داده شده",style: TextStyle(fontSize: 12,color: Colors.white)),
                            )

                          ],
                        ),
                      ],
                    ),
                  );
                },)
            )
          ],
        ),
      ),
    );
  }
}
