import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    this.width = double.infinity,
    this.height = 45,
    this.loading = false,
    required this.onPress,
    required this.text,
    super.key
  });

  final double width;
  final double height;
  final String text;
  final Function() onPress;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 45,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: loading? (){} : onPress,
      child: loading? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: Colors.white,)) : Text(text,style: const TextStyle(color: Color(0xFFF8F8F8),fontSize: 16,fontWeight: FontWeight.normal)),
    );
  }
}
