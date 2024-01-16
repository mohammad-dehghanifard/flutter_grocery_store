import 'package:flutter/material.dart';

class ShippingRadioButtonWidget extends StatefulWidget {
  const ShippingRadioButtonWidget({super.key});

  @override
  State<ShippingRadioButtonWidget> createState() => _ShippingRadioButtonWidgetState();
}

class _ShippingRadioButtonWidgetState extends State<ShippingRadioButtonWidget> {
  
  List<_ShippingMethod> shippingList = [
    _ShippingMethod(title: "پست پیشتاز (ارسال سریع)", price: "۲۰,۰۰۰", value: 1,selected: true),
    _ShippingMethod(title: "تیپاکس", price: "۱۰,۰۰۰", value: 2),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(shippingList.length, (index) {
        final _ShippingMethod shipping = shippingList[index];
        return Container(
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
                child: Visibility(
                  visible: shipping.selected,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      })
    );
  }
}

class _ShippingMethod {
  _ShippingMethod({required this.title,required this.price,this.selected = false,required this.value});
  final String title;
  final String price;
  final bool selected;
  final int value;
}
