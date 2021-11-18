import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextInputType? inputType;
  final TextEditingController? controller;
  final String hint;
  final IconData? icon;
  final double radius;
  final int maxLines;
  final String? initVal;
  final int minLines;
  final bool? obscureText;
  final Color borderColor;
  final Color? fillColor;
  final Function(String? val)? onChanged;
  const MyTextField({
    Key? key,
    this.controller,
    this.initVal,
    required this.hint,
    this.icon,
    this.maxLines = 1,
    this.radius = 15,
    this.obscureText,
    this.onChanged,
    this.inputType,
    this.minLines = 1, 
    this.borderColor = Colors.transparent,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: inputType,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.white60,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      initialValue: initVal,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.all(15),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius),
        ),
        fillColor: fillColor,
        enabled: true,
      ),
    );
  }
}
