import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/product.dart';

import 'header_list_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key, required this.listHeaderTitle, required this.products});

  final String listHeaderTitle;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        HeaderListWidget(title: listHeaderTitle,showMoreTap: () {}),
        const SizedBox(height: 15),
        // product list
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(left: 15,right: index == 0 ? 20 : 0),
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
                            child: Image.network(products[index].image ?? ""),
                          ),
                          //off label
                          Visibility(
                            visible: products[index].discountPercent != 0,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10,top: 5),
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF3D3D),
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child:  Text("${products[index].discountPercent}%",style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      // price
                       Row(
                        children: [
                          Text(products[index].price.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal)),
                          const Text('تومان',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C))),
                          if(products[index].discountPercent != 0)...[
                            const Spacer(),
                            Text(products[index].realPrice.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C),decoration: TextDecoration.lineThrough)),
                          ],
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(products[index].title ?? "",overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal))
                    ],
                  ),
                ),
              );
            },),
        )
      ],
    );
  }
}
