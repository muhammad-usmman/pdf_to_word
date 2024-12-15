import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_to_word/controller/cubits/conversion_cubit/conversion_cubit.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_and_drop_multiple_files.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_drop_dialog.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_drop_lock_unlock_pdf_dialog.dart';
import 'package:pdf_to_word/view/shared/tool_card.dart';

class PDFTools extends StatelessWidget {
  const PDFTools({super.key});

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
                  label: 'Lock PDF',
                  svg: 'assets/svg/Lock PDF.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropLockUnlockPdfDialog(
                        isLockPdf: true,
                        fileTypeExtension: const ['pdf'],
                        title: 'Lock PDF',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'Unlock PDF',
                  svg: 'assets/svg/Unlock PDF.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropLockUnlockPdfDialog(
                        isLockPdf: false,
                        fileTypeExtension: const ['pdf'],
                        title: 'Un Lock PDF',
                      ),
                    );
                  },

                ),
                ToolCard(
                  label: 'Split PDF',
                  svg: 'assets/svg/Split PDF.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        inputFieldsRequired: true,
                        fileTypeExtension: const ['pdf'],
                        callBack: (String filePath) {
                         },
                        callBackWithFields:(String filePath,String fieldText){
                          log('called');
                          context.read<ConversionCubit>().splitPdf(filePath,fieldText);

                        } ,
                        title: 'Split PDF',
                        fieldExplanation:'Split PDF into chunks of pages by a pattern.\nFor example, if you set 3,2 for a ten-page PDF,it would be divided into four PDF files that contain 3,2,3,2 pages accordingly.The pattern is repeated until there are no pages left.\nDefault is 1.',
                          fieldTitle: 'Split By Pattern',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'Merge PDF',
                  svg: 'assets/svg/Merge PDF.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialogMultipleFiles(
                        fileTypeExtension: const ['pdf'],
                        callBack: (List<String> filePath) {
                          context.read<ConversionCubit>().mergePDFs(filePath);
                        },
                        title: 'Merge PDF',

                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'Delete Pages',
                  svg: 'assets/svg/Delete Page.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        inputFieldsRequired: true,
                        fileTypeExtension: const ['pdf'],
                        callBack: (String filePath) {
                        },
                        callBackWithFields:(String filePath,String fieldText){
                          log('called');
                          context.read<ConversionCubit>().deletePdfPages(filePath,fieldText);
                        } ,
                        title: 'Delete PDF Pages',
                        fieldExplanation:'Set page range or individual pages to delete. Example 1-10 or 1,2,5.',
                        fieldTitle: 'Page Range',
                      ),
                    );

                  },
                ),
                ToolCard(
                  label: 'Delete Blank Pages',
                  svg: 'assets/svg/delete blank page icon.svg',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
