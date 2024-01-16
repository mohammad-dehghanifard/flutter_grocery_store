import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/product/controller/order_controller.dart';
import 'package:get/get.dart';

class ShippingRadioButtonWidget extends StatefulWidget {
  const ShippingRadioButtonWidget({super.key});

  @override
  State<ShippingRadioButtonWidget> createState() => _ShippingRadioButtonWidgetState();
}

class _ShippingRadioButtonWidgetState extends State<ShippingRadioButtonWidget> {
  
  List<ShippingMethod> shippingList = [
    ShippingMethod(title: "پست پیشتاز (ارسال سریع)", price: "20,000", value: 1),
    ShippingMethod(title: "تیپاکس", price: "10,000", value: 2),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(shippingList.length, (index) {
        final ShippingMethod shipping = shippingList[index];
        return GestureDetector(
          onTap: () {
            Get.find<OrderController>().onChangeShippingMethod(shipping);
            for (var item in shippingList) { item.selected = false;}
            shipping.selected = true;
            setState(() {});
          },
          child: Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFEBEBEB),width: 1),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: [
                Text(shipping.title,style: const TextStyle(fontSize: 14,color: Color(0xFF8C8C8C))),
                const Spacer(),
                Text(shipping.price,style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 4),
                const Text("تومان",style: TextStyle(fontSize: 12,color: Color(0xFF8C8C8C)),),
                const SizedBox(width: 8),
                // radio button
                Container(
                  width: 21,
                  height: 21,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF707070))
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear,
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: shipping.selected? Theme.of(context).primaryColor : Colors.transparent
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      })
    );
  }
}

class ShippingMethod {
  ShippingMethod({required this.title,required this.price,this.selected = false,required this.value});
  final String title;
  final String price;
  bool selected;
  final int value;
}
