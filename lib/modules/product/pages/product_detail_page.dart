import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/app_bar_button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:flutter_grocery_store/modules/product/widgets/add_product_to_cart_widget.dart';
import 'package:flutter_grocery_store/modules/product/widgets/comment_button_widget.dart';
import 'package:flutter_grocery_store/modules/product/widgets/product_slider_widget.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(action: AppBarButtonWidget(icon: Iconsax.heart,onTap: (){})),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ProductSliderWidget(
                        imageList: [
                          'https://dl.hitaldev.com/ecommerce/product_images/412286.jpg',
                          'https://dl.hitaldev.com/ecommerce/product_images/321174.jpg'
                        ]),
                    // category and realPrice
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        children: [
                          Text("دسته بندی: لبنیات",style: TextStyle(color: Theme.of(context).primaryColor)),
                          const Spacer(),
                          const Text("12,000",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C),decoration: TextDecoration.lineThrough)),
                          Container(
                            margin: const EdgeInsets.only(right: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFF3D3D),
                                borderRadius: BorderRadius.circular(4)
                            ),
                            child:  const Text("30%",style: TextStyle(color: Colors.white,fontSize: 9,fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                    ),
                    // price and name
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text("لیتری کاله۱شیر بطری پرچرب",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF3A3A3A))),
                          Spacer(),
                          Text("۱۱,۰۰۰",style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal,color: Color(0xFF3A3A3A))),
                          SizedBox(width: 4),
                          Text("تومان",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C))),
                        ],
                      ),
                    ),
                    // description
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Text(
                        "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده و از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و",
                        style: TextStyle(color: Color(0xFF8C8C8C),fontWeight: FontWeight.normal),
                      ),
                    ),
                    // commentButton
                    const CommentButtonWidget()
                  ],
                ),
              ),
            ),
            // add to cart button
            const AddProductToCartWidget()
          ],
        ),
      ),
    );
  }
}




