 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';

class ProFeatures extends StatelessWidget {
  const ProFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8.sw,
      height: 100,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient:   LinearGradient(colors: context.read<ThemeCubit>().state.themeData == AppThemes.light?[
          AppColors.red1,
          AppColors.red,
          AppColors.red1,
        ]:[
          const Color(0xFF303030),
          const Color(0xFF303030),
         ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svg/check_mark.svg'),
                  10.horizontalSpace,
                  const Text(
                    'Batch Conversions',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              Row(
                children: [
                  SvgPicture.asset('assets/svg/check_mark.svg'),
                  10.horizontalSpace,
                  const Text(
                    '100+ Supported Formats',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     // Row(
          //     //   children: [
          //     //     SvgPicture.asset('assets/svg/check_mark.svg'),
          //     //     10.horizontalSpace,
          //     //     // const Text(
          //     //     //   'PDF Editor',
          //     //     //   style: TextStyle(color: Colors.white),
          //     //     // ),
          //     //   ],
          //     // ),
          //     // Row(
          //     //   children: [
          //     //     SvgPicture.asset('assets/svg/check_mark.svg'),
          //     //     10.horizontalSpace,
          //     //     // const Text(
          //     //     //   'Add Watermarks in PDF',
          //     //     //   style: TextStyle(color: Colors.white),
          //     //     // ),
          //     //   ],
          //     // ),
          //   ],
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svg/check_mark.svg'),
                  10.horizontalSpace,
                  const Text(
                    'Lock & Unlock PDF',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/svg/check_mark.svg'),
                  10.horizontalSpace,
                  const Text(
                    'PDF to Word',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svg/check_mark.svg'),
                  10.horizontalSpace,
                  const Text(
                    'Photo to PDF',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/svg/check_mark.svg'),
                  10.horizontalSpace,
                  const Text(
                    'Merge PDF',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
