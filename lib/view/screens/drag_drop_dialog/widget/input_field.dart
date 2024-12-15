import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputType textInputType;
  const InputField({super.key, required this.controller, required this.title,this.textInputType= TextInputType.text,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 5),
      child: TextField(
        keyboardType:textInputType ,
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: Colors.red, width: 2),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.red,
      ),
    );
  }
}
