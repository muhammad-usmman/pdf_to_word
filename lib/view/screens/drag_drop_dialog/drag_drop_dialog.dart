import 'dart:developer';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/controller/cubits/file_picker_cubit/file_picker_cubit.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';
import 'package:pdf_to_word/view/shared/custom_button.dart';

class DragDropDialog extends StatefulWidget {
  final List<String> fileTypeExtension;

  const DragDropDialog({super.key, required this.fileTypeExtension});

  @override
  State<DragDropDialog> createState() => _DragDropDialogState();
}

class _DragDropDialogState extends State<DragDropDialog> {
  bool _dragging = false;
  String selectedFile = 'Drag & Drop File Here';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 0.8.sw,
        height: 0.7.sh,
        child: Stack(
          children: [
            // Main Card Container

            Positioned.fill(
              child: Container(
                width: 0.8.sw,
                height: 0.6.sh,
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
                    5.verticalSpace,
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Image to PDF",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
                        color: _dragging
                            ? AppColors.red.withOpacity(0.5)
                            : context.read<ThemeCubit>().state.themeData == AppThemes.light
                                ? Colors.white.withOpacity(0.8)
                                : Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropTarget(
                        onDragDone: (detail) {
                          // #todo: remove this call from here and think of something to make it wokrk like dynamic probably a callback
                          log(detail.files.first.path);
                          selectedFile = detail.files.first.name;
                          // ToPdfConversionRepo().convertDocxToPdf(
                          //     detail.files.first.path.toString(), 'C:/Users/Usman/Downloads');
                          setState(() {
                            // _list.addAll(detail.files);
                          });
                        },
                        onDragEntered: (detail) {
                          log(detail.globalPosition.toString());

                          setState(() {
                            _dragging = true;
                          });
                        },
                        onDragExited: (detail) {
                          log(detail.localPosition.toString());

                          setState(() {
                            _dragging = false;
                          });
                        },
                        child: DottedBorder(
                          color: context.read<ThemeCubit>().state.themeData == AppThemes.light
                              ? Colors.black
                              : AppColors.red,
                          dashPattern: const [8, 8],
                          radius: const Radius.circular(8),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 SvgPicture.asset('assets/svg/Upload.svg'),
                                const SizedBox(height: 16),
                                Text(
                                  selectedFile,
                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      height: 0.8,
                                      width: 100,
                                      color: AppColors.grey,
                                    ),
                                    Text(
                                      "OR",
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 26),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      height: 0.8,
                                      width: 100,
                                      color: AppColors.grey,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                CustomButton(
                                  onTap: () {
                                    context
                                        .read<FilePickerCubit>()
                                        .pickFile(widget.fileTypeExtension);
                                  },
                                  title: "Browse Files",
                                  height: 0.07.sh,
                                  width: 0.2.sw,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),

            Positioned(
              right: 28,
              top: 25,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
