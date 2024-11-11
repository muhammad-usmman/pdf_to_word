import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItem extends StatelessWidget {
  final String svg;
  final String label;
  final Function() onTap;
  const DrawerItem({required this.label, required this.svg, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Colors.white.withOpacity(0.3)))),
        child: Row(
          children: [
            SvgPicture.asset(svg),
            5.horizontalSpace,
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
