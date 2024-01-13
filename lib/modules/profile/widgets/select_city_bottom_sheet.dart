import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/backend/models/city.dart';

class SelectCityButtonSheet extends StatelessWidget {
  const SelectCityButtonSheet({super.key, required this.cityList, required this.onSelected});

  final List<City> cityList;
  final Function(City city) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cityList.length,
      padding: const EdgeInsets.all(25),
      itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () => onSelected(cityList[index]),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).primaryColor)
          ),
          child: Center(child: Text(cityList[index].name ?? "",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
        ),
      );
    },);
  }
}
