import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_to_word/controller/cubits/conversion_cubit/conversion_cubit.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_and_drop_multiple_files.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_drop_dialog.dart';
import 'package:pdf_to_word/view/shared/tool_card.dart';

class ConvertToPdf extends StatelessWidget {
  const ConvertToPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 6,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: [
                ToolCard(
                  label: 'Word to PDF',
                  svg: 'assets/svg/Word to PDF.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['doc', 'docx'],
                        callBack:(String filePath) {
                          context.read<ConversionCubit>().convertDocxToPdf(filePath);
                        },
                        title: 'Word to Pdf',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'Image to PDF',
                  svg: 'assets/svg/JPG to PDF (1).svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialogMultipleFiles(
                        fileTypeExtension: const [
                          'jpg',
                          'png',
                          'jpeg',
                          'gif',
                          'tiff',
                          'webp',
                          'heic',
                          'svg',
                          'psd'
                        ],
                        callBack: (List<String> filePath) {
                          context.read<ConversionCubit>().convertImagesToPdf(filePath);
                        },
                        title: 'Image to Pdf',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'PPT to PDF',
                  svg: 'assets/svg/PPT to PDF.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['ppt', 'pptx'],
                        callBack:(String filePath) {
                          context.read<ConversionCubit>().convertPptToPdf(filePath);
                        },
                        title: 'Ppt to Pdf',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'BMP to PDF',
                  svg: 'assets/svg/BMP to PDF.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const [
                          'bmp',
                        ],
                        callBack:(String filePath) {
                          context.read<ConversionCubit>().convertBmpToPdf(filePath);
                        },
                        title: 'Bmp to Pdf',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'Excel to PDF',
                  svg: 'assets/svg/Excel to PDF.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['xls', 'xlsx'],
                        callBack:(String filePath) {
                          context.read<ConversionCubit>().convertXlsToPdf(filePath);
                        },
                        title: 'Excel to Pdf',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
