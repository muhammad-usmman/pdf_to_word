import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/utils/download_url_file.dart';
 import 'package:pdf_to_word/utils/themes.dart';
import 'package:pdf_to_word/view/shared/custom_app_bar.dart';
import 'package:pdf_to_word/view/shared/custom_button.dart';

class DownloadMultipleConvertedFile extends StatefulWidget {
  final List<String> fileUrls;
  final List<String> fileNames;

  const DownloadMultipleConvertedFile({
    super.key,
    required this.fileUrls,
    required this.fileNames,
  });
  static MaterialPageRoute<void> route(List<String> fileUrls,List<String> fileNames) => MaterialPageRoute(
    builder: (_) =>   DownloadMultipleConvertedFile(fileUrls: fileUrls, fileNames: fileNames,),
  );
  @override
  State<DownloadMultipleConvertedFile> createState() => _DownloadMultipleConvertedFileState();
}

class _DownloadMultipleConvertedFileState extends State<DownloadMultipleConvertedFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(leading: SizedBox.shrink(),),
      body: Container(
        width: 1.sw,
        height: 1.sh,
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
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
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
                    const Text(
                      "File has been successfully Converted",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                    const SizedBox(height: 8),
                    CustomButton(

                      onTap: () {
                        DownloadFileUrl.downloadMultipleFiles(
                             widget.fileNames, widget.fileUrls,context);
                      },
                      title: "Click here to download",
                      height: 0.07.sh,
                      width: 0.35.sw,
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
