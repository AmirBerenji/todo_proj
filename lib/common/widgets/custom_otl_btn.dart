import 'package:flutter/material.dart';
import 'package:todo_proj/common/widgets/appstyle.dart';
import 'package:todo_proj/common/widgets/resuable_text.dart';

class CustomOtlnBtn extends StatelessWidget {
  const CustomOtlnBtn({super.key, this.onTap, required this.width, required this.height, this.color, required this.borderColor, required this.text});

  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color;
  final Color borderColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1,color: borderColor )
        ),
        child: Center(
          child: ResuableText(text: text, style: appstyle(18, borderColor, FontWeight.bold)),
        ),
      ),
    );
  }
}