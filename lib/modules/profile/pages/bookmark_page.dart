import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/product.dart';
import 'package:flutter_grocery_store/modules/profile/controller/book_mark_controller.dart';
import 'package:get/get.dart';

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
      child: GetBuilder<BookMarkController>(
        init: BookMarkController(),
        builder: (controller) {
          return controller.productResponse == null? const Center(child: CircularProgressIndicator()) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("علاقه مندی ها",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16)),
              const SizedBox(height: 15),
              Expanded(
                  child: ListView.builder(
                    itemCount: controller.productResponse!.productList!.length,
                    itemBuilder: (context, index) {
                      final Product product = controller.productResponse!.productList![index];
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
                              child: Center(child: Image.network(product.image!,height: 70)),
                            ),
                            const SizedBox(width: 12),
                            // title and price
                             Expanded(
                              child: SizedBox(
                                height: 103,
                                width: double.infinity,
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // product title
                                    Text(product.title ?? "",overflow: TextOverflow.ellipsis,maxLines: 2,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 15)),
                                    const Spacer(),
                                    // در صورتی که تخفیف داشته باشه با حالت دیگه نمایش داده میشه
                                    if(product.discountPercent != 0)...[
                                      // product real price
                                      Text(product.realPrice ?? "",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF8C8C8C),
                                              decoration:
                                              TextDecoration.lineThrough)),
                                      // product final price
                                      Row(
                                        children: [
                                          Text(product.price ?? "",
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF3A3A3A))),
                                          const SizedBox(width: 4),
                                          const Text("تومان",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF8C8C8C))),
                                        ],
                                      ),
                                    ] else...[
                                      Row(
                                        children: [
                                          Text(product.realPrice ?? "",
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF3A3A3A))),
                                          const SizedBox(width: 4),
                                          const Text("تومان",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF8C8C8C))),
                                        ],
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ),
                            // bookmark button
                            GestureDetector(
                              onTap: () => controller.removeBookmarkedProduct(id: product.id!),
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
                                child: const Center(
                                  child: Icon(
                                    CupertinoIcons.heart_fill,
                                    color: Color(0xFFED723F),
                                  ),
                                ),
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
          );
        }
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
