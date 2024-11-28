import 'package:flutter/material.dart';
import '../../UI/color.dart';
import 'custom_text.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.label,
      required this.textEditingController,
      required this.suffixIcon,
      required this.prefixIcon});
  final TextEditingController textEditingController;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      style: TextStyle(color:  Theme.of(context).textTheme.bodyLarge?.color,),
      decoration: InputDecoration(
        label:Text(label,style: TextStyle(fontSize: 20),),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
