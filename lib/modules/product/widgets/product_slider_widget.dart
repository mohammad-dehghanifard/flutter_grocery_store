import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductSliderWidget extends StatefulWidget {
  const ProductSliderWidget({super.key, required this.imageList});
  final List<String> imageList;


  @override
  State<ProductSliderWidget> createState() => _ProductSliderWidgetState();
}

class _ProductSliderWidgetState extends State<ProductSliderWidget> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: widget.imageList.length,
          options: CarouselOptions(
            height: 420,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                selectedImage = index;
              });
            },
            autoPlay: widget.imageList.length > 1,
            scrollPhysics: widget.imageList.length > 1? const PageScrollPhysics() : const NeverScrollableScrollPhysics(),
            autoPlayInterval: const Duration(seconds: 4),
          ),
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            return SizedBox(
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(widget.imageList[itemIndex],fit: BoxFit.cover,)),
            );
          },
        ),
        // indicator
        Visibility(
          visible: widget.imageList.length > 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.imageList.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: selectedImage == index? 25 : 8,
                  height:  8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: selectedImage == index? Theme.of(context).primaryColor : const Color(0xFFD2D2D2)
                  ),
                );
              }) ,
            ),
          ),
        )
      ],
    );
  }
}
