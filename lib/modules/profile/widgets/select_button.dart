import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key, required this.onTap, required this.text, this.showIcon = true
  });
  final Function() onTap;
  final String text;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Theme.of(context).dividerColor)
        ),
        child: Row(children: [
          Text(text,style: TextStyle(color: Theme.of(context).hintColor)),
          if(showIcon)...[
            const Spacer(),
            Icon(CupertinoIcons.chevron_down,color:Theme.of(context).hintColor)
          ]
        ]),
      ),
    );
  }
}