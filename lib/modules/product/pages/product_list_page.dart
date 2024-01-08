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
                Container(
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
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
