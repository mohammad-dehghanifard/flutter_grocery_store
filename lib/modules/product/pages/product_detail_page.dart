import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/helper/widgets/app_bar_button_widget.dart';
import 'package:flutter_grocery_store/helper/widgets/appbar_widget.dart';
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
          ],
        ),
      ),
    );
  }
}
