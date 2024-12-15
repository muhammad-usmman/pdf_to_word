import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';

class SubscriptionTiles extends StatelessWidget {
  const SubscriptionTiles(
      {super.key,
      this.active = false,
      required this.planName,
      required this.planDuration,
      required this.planPrice,
      required this.planDiscountedPrice});

  final bool active;
  final String planName;
  final String planDuration;
  final String planPrice;
  final String planDiscountedPrice;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 0.2.sw,
        height: 320,
        child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.5, color: active ? AppColors.red : Colors.transparent),
              borderRadius: BorderRadius.circular(8)),
          color: Theme.of(context).cardColor, // Explicitly inherit color from the theme

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: SizedBox(
                  width: double.infinity,

                  child: Stack(
                    children: [
                      if (active)
                        Positioned.fill(child: SvgPicture.asset('assets/svg/subsription_bg.svg')),
                      Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            planName,
                            style: TextStyle(
                                fontSize: 28,
                                color: active
                                    ? Colors.white
                                    : context.read<ThemeCubit>().state.themeData == AppThemes.light
                                        ? Colors.black
                                        : Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  planDuration,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
               FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  planDiscountedPrice,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  planPrice,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
               if (active)
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Free Trail",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.red,
                      color: AppColors.red,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
