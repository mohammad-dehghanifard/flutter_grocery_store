import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.icon,
    this.type = TextInputType.text,
    this.controller,
    this.validator,
    this.disabled = false
  });

  final String hintText;
  final IconData? icon;
  final TextInputType? type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool disabled;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: widget.disabled ? const TextStyle(color: Color(0xFFB4B4B4)) : const TextStyle(),
      readOnly: widget.disabled,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.type == TextInputType.visiblePassword ? obscure : false,
      keyboardType: widget.type,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 14),
        filled: true,
        fillColor: widget.disabled? const Color(0xFFEFEFEF) :Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).dividerColor)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Theme.of(context).dividerColor)
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFFF3D3D))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFFF3D3D))
        ),
        hintText: widget.hintText,
        suffixIcon: widget.icon != null ||
                  widget.type == TextInputType.visiblePassword
              ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: Icon(
                    widget.type != TextInputType.visiblePassword? widget.icon : (obscure? Iconsax.eye_slash : Iconsax.eye),
                    size: 22, color: Theme.of(context).dividerColor),
              )
              : null),
    );
  }
}
