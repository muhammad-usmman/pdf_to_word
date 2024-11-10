import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdf_to_word/controller/cubits/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';
import 'package:pdf_to_word/view/screens/payment_screen/pro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => const ProScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          context.read<ThemeCubit>().state.themeData == AppThemes.light
              ? AppColors.red
              : AppColors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/svg/splach_icon_svg.svg',
              width: 0.7.sw,
              height: 0.3.sh,
            ),
          ),
          20.verticalSpace,
          const Text(
            "PDF TO WORD",
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Text(
            "CONVERTER",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              wordSpacing: 5
            ),
          )
        ],
      ),
    );
  }
}
