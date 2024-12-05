import 'dart:developer';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/controller/cubits/conversion_cubit/conversion_cubit.dart';
import 'package:pdf_to_word/controller/cubits/file_picker_cubit/file_picker_cubit.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';
import 'package:pdf_to_word/utils/toast_helper.dart';
import 'package:pdf_to_word/view/screens/dowload_converted_file/dowload_multiple_converted_url.dart';
import 'package:pdf_to_word/view/screens/dowload_converted_file/download_converted_url_page.dart';
import 'package:pdf_to_word/view/shared/custom_button.dart';

class DragDropDialog extends StatefulWidget {
  final List<String> fileTypeExtension;
  final Function(String filePath) callBack;
  final String title;

  ///(String filePath,String fieldText)
  final Function(String filePath, String fieldText)? callBackWithFields;
  final String? fieldTitle;
  final String? fieldExplanation;
  final bool inputFieldsRequired;

  ///callBackWithFields fieldTitle fieldExplanation only work if inputFieldsRequired is set to true then the callback wont work
  const DragDropDialog(
      {super.key,
      required this.fileTypeExtension,
      required this.callBack,
      required this.title,
      this.inputFieldsRequired = false,
      this.fieldTitle,
      this.fieldExplanation,
      this.callBackWithFields});

  @override
  State<DragDropDialog> createState() => _DragDropDialogState();
}

class _DragDropDialogState extends State<DragDropDialog> {
  bool _dragging = false;
  String selectedFile = 'Drag & Drop File Here';
  String selectedFilePath = '';
  TextEditingController fieldController = TextEditingController();

  @override
  void dispose() {
    fieldController.dispose();
    super.dispose();
  }

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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
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
                      child: BlocConsumer<ConversionCubit, ConversionState>(
                        listener: (context, state) {
                          if (state is ConversionLoaded && mounted) {
                            ToastHelper.success(context, 'File conversion Successful');
                            Navigator.push(context,
                                DownloadConvertedFile.route(state.fileUrl, state.fileName));
                          } else if (state is ConversionError && mounted) {
                            ToastHelper.success(context,
                                'Something Unexpected happened. Check your Internet or Try again');
                            Navigator.pop(context);
                          }

                          if (state is ConversionListLoaded && mounted) {
                            ToastHelper.success(context, 'File conversion Successful');
                            log(state.fileUrls.length.toString());
                            log(state.fileNames.length.toString());
                            Navigator.push(
                                context,
                                DownloadMultipleConvertedFile.route(
                                    state.fileUrls, state.fileNames));
                          }
                        },
                        builder: (context, state) {
                          if (state is ConversionLoading) {
                            return SpinKitFadingCube(
                              itemBuilder: (BuildContext context, int index) {
                                return DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: index.isEven
                                        ? Colors.red
                                        : context.read<ThemeCubit>().state.themeData ==
                                                AppThemes.light
                                            ? AppColors.black
                                            : Colors.white,
                                  ),
                                );
                              },
                            );
                          } else {
                            return DropTarget(
                              onDragDone: (detail) async {
                                log(detail.files.first.path);
                                selectedFile = detail.files.first.name;
                                selectedFilePath = detail.files.first.path;
                                // var result = await ToPdfConversionRepo().convertDocxToPdf(
                                //     detail.files.first.path.toString(), );
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //               DownloadConvertedFile(fileUrl: result['fileUrl']!, fileName: result['fileName']!,)));
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
                                  child: BlocConsumer<FilePickerCubit, FilePickerState>(
                                    listener: (context, state) {
                                      if (state is FilePickerError) {
                                        ToastHelper.warning(context, state.error, '');
                                      } else if (state is FilePickerLoaded) {
                                        setState(() {
                                          selectedFilePath = state.finalUrl.first;
                                          selectedFile = state.fileName.first;
                                        });
                                        print(selectedFile);
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is FilePickerLoading) {
                                        return SpinKitFadingCube(
                                          itemBuilder: (BuildContext context, int index) {
                                            return DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: index.isEven ? Colors.red : Colors.grey,
                                              ),
                                            );
                                          },
                                        );
                                      }

                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          if (selectedFilePath.isEmpty)
                                            SvgPicture.asset('assets/svg/Upload.svg'),
                                          const SizedBox(height: 16),
                                          Text(
                                            selectedFile,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600, fontSize: 24),
                                          ),
                                          if (selectedFilePath.isEmpty)
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.symmetric(horizontal: 10),
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
                                                  margin:
                                                      const EdgeInsets.symmetric(horizontal: 10),
                                                  height: 0.8,
                                                  width: 100,
                                                  color: AppColors.grey,
                                                ),
                                              ],
                                            ),
                                          const SizedBox(height: 8),
                                          if (selectedFilePath.isEmpty)
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
                                          if (widget.inputFieldsRequired &&
                                              selectedFilePath.isNotEmpty)
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 16.0, vertical: 5),
                                                  child: TextField(
                                                    controller: fieldController,
                                                    decoration: InputDecoration(
                                                      labelText: widget.fieldTitle,
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
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(horizontal: 16.0),
                                                  child: Text(
                                                    widget.fieldExplanation ?? '',
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w300, fontSize: 12),
                                                  ),
                                                )
                                              ],
                                            ),
                                          10.verticalSpace,
                                          if (selectedFilePath.isNotEmpty)
                                            CustomButton(
                                              onTap: () {
                                                widget.inputFieldsRequired
                                                    ? widget.callBackWithFields!(
                                                        selectedFilePath, fieldController.text)
                                                    : widget.callBack(selectedFilePath);
                                              },
                                              title: "Convert",
                                              height: 0.07.sh,
                                              width: 0.2.sw,
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          }
                        },
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
