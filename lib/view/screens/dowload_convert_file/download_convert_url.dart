 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
  import 'package:pdf_to_word/utils/themes.dart';
import 'package:pdf_to_word/view/shared/custom_app_bar.dart';
import 'package:pdf_to_word/view/shared/custom_button.dart';

class DownloadConvertedFile extends StatefulWidget {
  const DownloadConvertedFile({super.key});

  @override
  State<DownloadConvertedFile> createState() => _DownloadConvertedFileState();
}

class _DownloadConvertedFileState extends State<DownloadConvertedFile> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
     appBar: const CustomAppBar(),
      body: Container(
        // width: 0.8.sw,
        // height: 0.6.sh,
        decoration: BoxDecoration(
          color: context.read<ThemeCubit>().state.themeData == AppThemes.light
              ? Colors.transparent
              : Colors.black,
          image: DecorationImage(
            image: AssetImage(context.read<ThemeCubit>().state.themeData == AppThemes.light
                ? 'assets/svg/BG.png'
                : 'assets/svg/black bg.png'),
            filterQuality: FilterQuality.high,
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title

            const Spacer(),
            // File Upload Area
            Container(
              width: 0.45.sw,
              height: 0.45.sh,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    // Shadow color with transparency
                    blurRadius: 8,
                    // Softens the shadow
                    spreadRadius: 1,
                    // Extends the shadow slightly
                    offset:
                    const Offset(0, 4), // Position of the shadow (horizontal, vertical)
                  ),
                ],
                color: context.read<ThemeCubit>().state.themeData == AppThemes.light
                    ? Colors.white.withOpacity(0.8)
                    : Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Placeholder for an upload icon/image

                    const Text(
                      "File has been successfully Converted",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    ),

                    const SizedBox(height: 8),
                    CustomButton(
                      onTap: () {
                        // Add your file browsing logic here
                      },
                      title: "Click here to download",
                      height: 0.07.sh,
                      width: 0.2.sw,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
