import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';

class CustomDropDown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String? selectedValue) onChanged;

  const CustomDropDown(
      {super.key, required this.value, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // width: 0.2.sw,
        height: 0.055.sh,
        decoration: BoxDecoration(
            color: context.read<ThemeCubit>().state.themeData == AppThemes.light
                ? Colors.white
                : AppColors.black1,
            borderRadius: BorderRadius.circular(12)),

        child: DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((size) => DropdownMenuItem(
                    value: size,
                    child: Text(size),
                  ))
              .toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
        ),
      ),
    );
  }
}
