import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/home/widgets/category_list_widget.dart';
import 'package:flutter_grocery_store/modules/home/widgets/slider_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // sliders
        Padding(
          padding: EdgeInsets.all(20),
          child: SliderWidget(imageList: [
            "https://dl.hitaldev.com/ecommerce/sliders/429306.jpg",
            "https://dl.hitaldev.com/ecommerce/sliders/429219.jpg",
            "https://dl.hitaldev.com/ecommerce/sliders/470497.jpg"
          ]),
        ),
        SizedBox(height: 20),
        CategoryListWidget()
      ],
    );
  }
}
