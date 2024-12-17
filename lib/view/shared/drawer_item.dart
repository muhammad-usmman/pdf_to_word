import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/utils/themes.dart';

class DrawerItem extends StatelessWidget {
  final String svg;
  final String label;
  final Function() onTap;
  final bool selected;

  const DrawerItem({super.key, required this.label, required this.svg, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 18.sp),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.3),
          // Light splash effect
          hoverColor: Colors.orange.withOpacity(0.6),
          child: Container(
            height: 60.sp,
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 3.sp),
            // margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
            decoration: BoxDecoration(
              color:selected? context.read<ThemeCubit>().state.themeData == AppThemes.light
                  ? Colors.black.withOpacity(0.1)
                  : Colors.white.withOpacity(0.3)  :Colors.transparent,
              borderRadius: BorderRadius.circular(18),
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  svg,
                  width: 30.sp,
                  height: 30.sp,
                ),
                8.horizontalSpace,
                Expanded(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(label,
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17.sp)),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
