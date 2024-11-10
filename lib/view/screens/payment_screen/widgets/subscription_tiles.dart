import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/utils/colors.dart';

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
    return SizedBox(
      width: 0.2.sw,
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.5, color: active ? AppColors.red : Colors.transparent),
            borderRadius: BorderRadius.circular(8)),
        // elevation: 5,
        // borderOnForeground: true,
        // surfaceTintColor: Colors.transparent,
        color: const Color(0xFFFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: Stack(
                  children: [
                    if(active)
                    Positioned.fill(
                        child:
                            SvgPicture.asset('assets/svg/subsription_bg.svg')),
                      Center(
                      child: Text(
                       planName,
                        style:   TextStyle(
                            fontSize: 28,
                            color: active?Colors.white:Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Text(
              planDuration,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            10.verticalSpace,
              Text(
              planDiscountedPrice,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
              Text(
              planPrice,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            5.verticalSpace,
            if(active)
            const Text(
              "Free Trail",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.red,
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
