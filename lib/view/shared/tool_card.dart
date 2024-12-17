import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolCard extends StatelessWidget {
  final String label;
  final String svg;
  final Function() onTap;

  const ToolCard({super.key, required this.label, required this.svg, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.05.sh,
      width: 0.05.sh
      ,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          // color: Colors.white,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                12.verticalSpace,
                SvgPicture.asset(
                  svg,
                  height: 90.sp,
                  width: 90.sp,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(label, textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
