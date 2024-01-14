import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("علاقه مندی ها",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
          const SizedBox(height: 15),
          Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text("شکلات شیری با مغزی ویفر",overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                                Spacer(),
                                // product real price
                                Text("12,0000",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF8C8C8C),
                                        decoration:
                                        TextDecoration.lineThrough)),
                                // product final price
                                Row(
                                  children: [
                                    Text("200,000",
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
                        // bookmark button
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: const Color(0xFFEBEBEB), width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0xFFEA5E24)
                                      .withOpacity(0.15),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1))
                            ]),
                          child: const Icon(
                            CupertinoIcons.heart_fill,
                            color: Color(0xFFED723F),
                          ),
                        )
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
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
