import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_state.dart';
import 'package:pdf_to_word/main.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final String img;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;
  final double height;

  const OptionButton({super.key,
    required this.text,
    required this.isSelected,
    required this.onTap, required this.width, required this.height, required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: context.read<ThemeCubit>().state.themeData == AppThemes.light ? Colors.white: AppColors.black1,
          border: Border.all(color:  isSelected ? Colors.red :Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(img),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
               ),
            ),
          ],
        ),
      ),
    );
  }
}