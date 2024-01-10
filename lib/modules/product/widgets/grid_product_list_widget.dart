import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/product/controller/product_list_controller.dart';
import 'package:flutter_grocery_store/modules/product/pages/product_detail_page.dart';
import 'package:get/get.dart';

class GridProductListWidget extends StatelessWidget {
  const GridProductListWidget({super.key, required this.controller});

  final ProductListController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.products!.length,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 200,
          crossAxisSpacing: 10
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Get.to(ProductDetailPage(id: controller.products![index].id!)),
          child: SizedBox(
            width: 118,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    // image product
                    Container(
                      height: 130,
                      width: 118,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Theme.of(context).dividerColor,width: 1),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xFF14489E).withOpacity(0.15),
                                blurRadius: 3,
                                offset: const Offset(0,1)
                            )
                          ]
                      ),
                      child: Image.network(controller.products![index].image ?? ""),
                    ),
                    //off label
                    Visibility(
                      visible: controller.products![index].discountPercent != 0,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10,top: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFF3D3D),
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child:  Text("${controller.products![index].discountPercent}%",style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal)),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // price
                Row(
                  children: [
                    Text(controller.products![index].price.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal)),
                    const Text('تومان',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C))),
                    if(controller.products![index].discountPercent != 0)...[
                      const Spacer(),
                      Text(controller.products![index].realPrice.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C),decoration: TextDecoration.lineThrough)),
                    ],
                  ],
                ),
                const SizedBox(height: 5),
                Text(controller.products![index].title ?? "",overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal))
              ],
            ),
          ),
        );
      },);
  }
}
