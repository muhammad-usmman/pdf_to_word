
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolCard extends StatelessWidget {
  final String label;
  final String svg;
  final Function() onTap;
  const ToolCard({super.key, required this.label, required this.svg, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          // color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svg,
                height: 80,
                width: 80,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(height: 10),
              Text(label, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
