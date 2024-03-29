import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/province.dart';

class SelectProvinceButtonSheet extends StatelessWidget {
  const SelectProvinceButtonSheet({super.key, required this.provinceList, required this.onSelected});

  final List<Province> provinceList;
  final Function(Province province) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: provinceList.length,
      padding: const EdgeInsets.all(25),
      itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () => onSelected(provinceList[index]),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).primaryColor)
          ),
          child: Center(child: Text(provinceList[index].name ?? "",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
        ),
      );
    },);
  }
}
