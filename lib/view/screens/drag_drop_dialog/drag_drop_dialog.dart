import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/controller/cubits/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/repositories/to_pdf_conversions_repos/to_pdf_repo.dart';
import 'package:pdf_to_word/utils/themes.dart';
import 'package:pdf_to_word/view/shared/custom_button.dart';

class DragDropDialog extends StatefulWidget {
  const DragDropDialog({super.key});

  @override
  State<DragDropDialog> createState() => _DragDropDialogState();
}

class _DragDropDialogState extends State<DragDropDialog> {
  @override
  Widget build(BuildContext context) {
    // late DropzoneViewController controller1;

    String? filePath;
    bool highlighted1 = false;

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
                        color: context.read<ThemeCubit>().state.themeData == AppThemes.light
                            ? Colors.white.withOpacity(0.8)
                            : Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          DropTarget(
                            onDragDone: (detail) {
                              print(detail.files.first.path);
                              ToPdfConversionRepo().convertDocxToPdf(detail.files.first.path.toString(), 'C:/Users/Usman/Downloads');
                              setState(() {
                                // _list.addAll(detail.files);
                              });
                            },
                            onDragEntered: (detail) {
                              print(detail.globalPosition);

                              setState(() {
                                // _dragging = true;
                              });
                            },
                            onDragExited: (detail) {
                              print(detail.localPosition);

                              setState(() {
                                // _dragging = false;
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
                                    // Placeholder for an upload icon/image
                                    SvgPicture.asset('assets/svg/Upload.svg'),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "Drag & Drop File Here",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 10),
                                          height: 0.8,
                                          width: 100, // Height of the divider line
                                          color: AppColors.grey, // Color of the divider
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
                                          width: 100, // Height of the divider line
                                          color: AppColors.grey, // Color of the divider
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    CustomButton(
                                      onTap: () {
                                        // Add your file browsing logic here
                                      },
                                      title: "Browse Files",
                                      height: 0.07.sh,
                                      width: 0.2.sw,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
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
