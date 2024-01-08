import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/category.dart';
import 'header_list_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key, required this.categoryList});

  final List<Category> categoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderListWidget(title: 'دسته بندی ها',showMoreTap: () {}),
        const SizedBox(height: 15),
        // Category list
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 91,
                  height: 91,
                  padding: const EdgeInsets.all(12),
                  margin:  EdgeInsets.only(left: 15,right: index == 0 ? 20 : 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF14489E).withOpacity(0.15),
                        blurRadius: 3,
                        offset: const Offset(0,1)
                      )
                    ],
                    border: Border.all(color: Theme.of(context).dividerColor,width: 1)
                  ),
                  child: Image.network(categoryList[index].image ?? ""),
                ),
                const SizedBox(height: 5),
                 Text(categoryList[index].title ?? "",overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal))
              ],
            );
          },),
        )
      ],
    );
  }
}


