import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Button extends StatelessWidget {
  final Function() onTap;
  final String icon;
final bool bottomLine;
  const Button({
    super.key,
    required this.onTap,
    required this.icon,   this.bottomLine= false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:   BoxDecoration(
          border:bottomLine? const Border(bottom: BorderSide(width: 2, color: Color(0xffe06868))):null),
      margin: const EdgeInsets.symmetric(horizontal: 13),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  icon,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              )),
        ),
      ),
    );
  }
}
