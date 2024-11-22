import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      this.text = "",
      this.fontsize,
      this.alignment = Alignment.topLeft,
      this.maxLines = 1,
      this.height = 1,
      this.fontWeight = FontWeight.normal});
  final Alignment alignment;
  final String text;
  double? fontsize;
  final int maxLines;
  final double height;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        maxLines: maxLines,
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          height: height,
          color: Theme.of(context).textTheme.bodyLarge?.color
          ,fontSize: fontsize ?? 16,
        ),
      ),
    );
  }
}
