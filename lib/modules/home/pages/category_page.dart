import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/home/controller/category_controller.dart';
import 'package:flutter_grocery_store/modules/product/pages/product_list_page.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  GetBuilder<CategoryController>(
      init: CategoryController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("دسته بندی ها",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                const SizedBox(height: 20),
                //category list
              controller.categoryData == null
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        itemCount: controller.categoryData!.categoryList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 120),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.to(ProductListPage(categoryId: controller.categoryData!.categoryList![index].id)),
                          child: Column(
                            children: [
                              Container(
                                width: 91,
                                height: 91,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xFF14489E)
                                              .withOpacity(0.15),
                                          blurRadius: 3,
                                          offset: const Offset(0, 1))
                                    ],
                                    border: Border.all(
                                        color: Theme.of(context).dividerColor,
                                        width: 1)),
                                child: Image.network(
                                    controller.categoryData!.categoryList![index].image ?? ""),
                              ),
                              const SizedBox(height: 5),
                              Text(controller.categoryData!.categoryList![index].title ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal))
                            ],
                          ),
                        );
                      },
                    )),
            ],
            ),
          );
        },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
