import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/product/controller/product_list_controller.dart';


class CategoryTextListWidget extends StatelessWidget {
  const CategoryTextListWidget({super.key, required this.controller});

  final ProductListController controller;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: controller.categories!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.selectCategory(controller.categories![index].id!),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: controller.categoryIndex == controller.categories![index].id! ? Theme.of(context).primaryColor : Colors.transparent,
                  border: Border.all(color: Theme.of(context).primaryColor)
              ),
              child: Center(child: Text(controller.categories![index].title!,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: controller.categoryIndex == controller.categories![index].id! ? Colors.white :Theme.of(context).primaryColor),)),
            ),
          );
        },
      ),
    );
  }
}
