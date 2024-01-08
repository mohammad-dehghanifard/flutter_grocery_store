import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
import 'package:iconsax/iconsax.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(title: "محصولات"),
            const SizedBox(height: 20),
            // filter and search
            Row(
              children: [
                const SizedBox(width: 20),
                // search
                Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xFFEA5E24).withOpacity(0.19),
                                blurRadius: 4,
                                offset: const Offset(0,1)
                            )
                          ]
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "نام محصول مورد نظر را بنویسید",
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                          suffixIcon: Icon(Iconsax.search_favorite)
                        ),
                      ),
                    )
                ),
                const SizedBox(width: 20),
                // filter
                PopupMenuButton(
                    position: PopupMenuPosition.under,
                    color: Colors.white,
                    surfaceTintColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    itemBuilder: (context) {
                      return [
                         PopupMenuItem(child: Container(
                           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1))
                            ),
                            child: const Center(child: Text("جدیدترین ها")))),
                         PopupMenuItem(child: Container(
                           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1))
                            ),
                            child: const Center(child: Text("بیشترین تخفیف")))),
                         PopupMenuItem(child: Container(
                           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Color(0xFFDEDEDE),width: 1))
                            ),
                            child: const Center(child: Text("ارزانترین")))),
                         PopupMenuItem(child: Container(
                           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: const Center(child: Text("گرانترین")))),
                      ];
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      margin: const EdgeInsets.only(left: 20),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xFFEA5E24).withOpacity(0.19),
                                blurRadius: 4,
                                offset: const Offset(0,1)
                            )
                          ]
                      ),
                      child: const Icon(Iconsax.sort),
                    ))

              ],
            ),
            const SizedBox(height: 20),
            // category list
            SizedBox(
              height: 32,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Theme.of(context).primaryColor)
                      ),
                      child: Center(child: Text("گوشت و پروتئین",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Theme.of(context).primaryColor),)),
                    );
                  },
              ),
            ),
            const SizedBox(height: 20),
            // product list
            Expanded(
                child: GridView.builder(
                  itemCount: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 10

                    ),
                    itemBuilder: (context, index) {
                      return SizedBox(
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
                                  child: Image.network("https://dl.hitaldev.com/ecommerce/product_images/412286.jpg"),
                                ),
                                //off label
                                Visibility(
                                  visible: false,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10,top: 5),
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFF3D3D),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child:  Text("30%",style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            // price
                            Row(
                              children: [
                                Text("100000",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal)),
                                const Text('تومان',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C))),
                                  const Spacer(),
                                  Text("200000",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xFF8C8C8C),decoration: TextDecoration.lineThrough)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(" لیتر۱شیر بطری پرچرب ",overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal))
                          ],
                        ),
                      );
                    },)
            ),
          ],
        ),
      ),
    );
  }
}
