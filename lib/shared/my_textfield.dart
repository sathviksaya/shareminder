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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: inputType,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black54,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      initialValue: initVal,
      style: const TextStyle(color: Colors.black87),
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
        fillColor: Colors.grey[200],
        enabled: true,
      ),
    );
  }
}
