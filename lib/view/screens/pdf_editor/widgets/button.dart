import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  const Button({super.key, required this.onTap, required this.icon, });

  @override
  Widget build(BuildContext context) {
    return   IconButton(onPressed: (){}, icon: Icon(icon));
  }
}
