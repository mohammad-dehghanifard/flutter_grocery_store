import 'package:flutter/material.dart';

import 'header_list_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key, required this.listHeaderTitle});

  final String listHeaderTitle;
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
            itemCount: 10,
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
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xFF14489E).withOpacity(0.15),
                                      blurRadius: 3,
                                      offset: const Offset(0,1)
                                  )
                                ]
                            ),
                            child: Image.network("https://dl.hitaldev.com/ecommerce/category_images/400967.png"),
                          ),
                          //off label
                          Container(
                            margin: const EdgeInsets.only(left: 20,top: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF3D3D),
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: const Text("30%",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal)),
                          )
                        ],
                      ),
                      // price
                      const Row(
                        children: [
                          Text('۱۱,۰۰۰',style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal)),
                          Text('تومان',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C))),
                          Spacer(),
                          Text('۱۲,۰۰۰',style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C),decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text("لبنیات",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal))
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
