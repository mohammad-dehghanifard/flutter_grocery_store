import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {this.width = double.infinity,
      this.height = 45,
      this.loading = false,
      this.hasBorder = false,
      this.showIcon = false,
      required this.onPress,
      this.text = '',
      super.key,
      this.widget});

  final double width;
  final double height;
  final String text;
  final Function() onPress;
  final bool loading;
  final bool hasBorder;
  final bool showIcon;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: double.infinity,
        height: height,
        color: hasBorder ? Colors.transparent : Theme.of(context).primaryColor,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: hasBorder
                    ? Theme.of(context).primaryColor
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(12)),
        onPressed: loading ? () {} : onPress,
        child: loading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ))
            : widget ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showIcon)
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Icon(Icons.add,
                            size: 20, color: Theme.of(context).primaryColor),
                      ),
                    Text(text,
                        style: TextStyle(
                            color: hasBorder
                                ? Theme.of(context).primaryColor
                                : const Color(0xFFF8F8F8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ],
                ));
  }
}
