import 'package:flutter/material.dart';

class SelectProvinceButtonSheet extends StatelessWidget {
  const SelectProvinceButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 32,
      padding: const EdgeInsets.all(25),
      itemBuilder: (context, index) {
      return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).primaryColor)
        ),
        child: Center(child: Text("استان  $index",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
      );
    },);
  }
}
