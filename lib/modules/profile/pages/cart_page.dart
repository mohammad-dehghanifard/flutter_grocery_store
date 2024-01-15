import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/button_widget.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("سبد خرید",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
          const SizedBox(height: 15),
          // item lis
          Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // product image
                          Container(
                            width: 97,
                            height: 97,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: const Color(0xFFEBEBEB),width: 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).primaryColor.withOpacity(0.15),
                                      blurRadius: 3,offset: const Offset(0,1)
                                  )
                                ]
                            ),
                            child: Center(child: Image.network("https://dl.hitaldev.com/ecommerce/product_images/412286.jpg",height: 70)),
                          ),
                          const SizedBox(width: 12),
                          // title and price
                           const Expanded(
                            child: SizedBox(
                              height: 103,
                              width: double.infinity,
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // product title
                                  Text("نوشابه انرژی زای موهیتو",overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                                  Spacer(),
                                    // product real price
                                    Text("12.000",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF8C8C8C),
                                            decoration:
                                            TextDecoration.lineThrough)),
                                    // product final price
                                    Row(
                                      children: [
                                        Text( "15.0000",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xFF3A3A3A))),
                                        SizedBox(width: 4),
                                        Text("تومان",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xFF8C8C8C))),

                                      ],
                                    ),

                                ],
                              ),
                            ),
                          ),
                          // remove button and item count
                          SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // remove button
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: const Color(0xFFEBEBEB), width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: const Color(0xFFEA5E24)
                                                  .withOpacity(0.15),
                                              blurRadius: 4,
                                              offset: const Offset(0, 1))
                                        ]),
                                    child:  Center(
                                      child: Icon(
                                        Iconsax.trash,
                                        size: 20,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                // item count
                                Container(
                                    width: 103,
                                    height: 35,
                                    padding: const EdgeInsets.symmetric(horizontal: 6),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: const Color(0xFFEBEBEB), width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: const Color(0xFFEA5E24)
                                                  .withOpacity(0.15),
                                              blurRadius: 4,
                                              offset: const Offset(0, 1))
                                        ]),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Iconsax.minus,color: Theme.of(context).primaryColor),
                                        Text("2",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor),),
                                        Icon(Iconsax.add,color: Theme.of(context).primaryColor),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // divider
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(color: Color(0xFFE1E1E1),width: 1))
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  );
                },)
          ),
          // price card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFEBEBEB),width: 1),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.15),
                  blurRadius: 3,offset: const Offset(0,1)
                )
              ],
            ),
            child:  Column(
              children: [
                // price
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text( "مبلغ:",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF8C8C8C))),
                      Spacer(),
                      Text( "15,0000",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                             )),
                      SizedBox(width: 4),
                      Text("تومان",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF8C8C8C))),

                    ],
                  ),
                ),
                const SizedBox(height: 6),
                // discount
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text( "مبلغ تخفیف:",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF8C8C8C))),
                      Spacer(),
                      Text( "10,0000",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color((0xFFFC7878))
                          )),
                      SizedBox(width: 4),
                      Text("تومان",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF8C8C8C))),

                    ],
                  ),
                ),
                // final price
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16)
                    )
                  ),
                  child: const Row(
                    children: [
                      Text( "مبلغ تخفیف:",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                      Spacer(),
                      Text( "10,0000",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                      SizedBox(width: 4),
                      Text("تومان",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF8C8C8C))),

                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
          // save order button
          ButtonWidget(onPress: () {},height: 52, text: "ثبت سفارش")
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
