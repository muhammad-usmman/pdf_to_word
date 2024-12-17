import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/prefrences/user_prefs.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget leading;
    const CustomAppBar({
    super.key, required this.leading,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  ValueNotifier<bool> whiteTheme = ValueNotifier<bool>(UserPrefs.getTheme());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.leading,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("PDF TO WORD", style: TextStyle(fontSize: 18, )),
          Text("CONVERTER", style: TextStyle(fontSize: 12, )),
        ],
      ),
      actions: [

        Center(
          child: AdvancedSwitch(
            onChanged: (value) {
              // The value is the updated state of the switch (true/false)
              whiteTheme.value = value;
              context.read<ThemeCubit>().toggleTheme();
            },                width: 42.0,
            height: 22.0,
            disabledOpacity: 1.0,
            activeColor: AppColors.red,
            // inactiveColor: Colors.white54,
            controller: whiteTheme,
            borderRadius: BorderRadius.circular(50.0),
            thumb: Center(
              child: Container(
                height: 24.0,
                width: 24.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        )  ,
        15.horizontalSpace,
        InkWell(
          child: Container(
              width: 45,
              height: 45,decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.red,
          ),

              child: Center(child: SvgPicture.asset('assets/svg/language.svg'))),
          onTap: () {},
        ),
      ],
      elevation: 0,
    );
  }
}
