import 'package:flutter/material.dart';
 import 'package:pdf_to_word/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final double height;
  final double width;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.red, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style:   const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
