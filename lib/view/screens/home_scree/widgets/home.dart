import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_to_word/controller/cubits/conversion_cubit/conversion_cubit.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_and_drop_multiple_files.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_drop_dialog.dart';
import 'package:pdf_to_word/view/shared/tool_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                  label: 'Image to PDF',
                  svg: 'assets/svg/JPG to PDF.svg',
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
                  label: 'Image to Text',
                  svg: 'assets/svg/IMAGE to text.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
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
                        callBack: (String filePath) {},
                        title: 'Image to Text',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'PNG to JPG',
                  svg: 'assets/svg/png to jpg.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['png'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertPngToJpg(filePath);
                        },
                        title: 'PNG to Jpg',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'GIF to JPG',
                  svg: 'assets/svg/gif to jpg.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['gif'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertGifToJpg(filePath);
                        },
                        title: 'Gif to Jpg',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'JPG to PNG',
                  svg: 'assets/svg/jpg to png.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['jpg'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertJpgToPng(filePath);
                        },
                        title: 'JPG to PNG',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'GIF to PNG',
                  svg: 'assets/svg/gif to png.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['gif'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertGifToPng(filePath);
                        },
                        title: 'Gig to PNG',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'PPT to ZIP',
                  svg: 'assets/svg/PPT TO ZIP.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['ppt', 'pptx'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertAnyToZip(filePath);
                        },
                        title: 'PPT to Zip',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'Text to ZIP',
                  svg: 'assets/svg/TXT TO ZIP.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['txt'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertAnyToZip(filePath);
                        },
                        title: 'Text to Zip',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'Image to ZIP',
                  svg: 'assets/svg/IMG to ZIP.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const [
                          'ppt',
                          'pptx',
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
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertAnyToZip(filePath);
                        },
                        title: 'Image to Zip',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'Word to ZIP',
                  svg: 'assets/svg/Word to ZIP.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['doc', 'docx'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertAnyToZip(filePath);
                        },
                        title: 'Word to Zip',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'PDF to ZIP',
                  svg: 'assets/svg/PDF to ZIP.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['pdf'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertAnyToZip(filePath);
                        },
                        title: 'Pdf to Zip',
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
