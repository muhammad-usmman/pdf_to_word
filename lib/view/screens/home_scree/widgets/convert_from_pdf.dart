import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_to_word/controller/cubits/conversion_cubit/conversion_cubit.dart';
import 'package:pdf_to_word/utils/prefrences/user_prefs.dart';
 import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_drop_dialog.dart';
import 'package:pdf_to_word/view/screens/payment_screen/pro_screen.dart';
import 'package:pdf_to_word/view/shared/tool_card.dart';

class ConvertFromPdf extends StatelessWidget {
  const ConvertFromPdf({super.key});

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
                  label: 'PDF to Word',
                  svg: 'assets/svg/PDF to Word.svg',
                  onTap: () {
                    UserPrefs.getPremiumStatus()?
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['pdf'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertPdfToDocx(filePath);
                        },
                        title: 'PDF to Word',
                      ),
                    ) : Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) => ProScreen()));
                  },
                ),
                ToolCard(
                  label: 'PDF to JPG',
                  svg: 'assets/svg/PDF to Image.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['pdf'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertPdfToJpg(filePath);
                        },
                        title: 'PDF to Jpg',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'PDF to Text',
                  svg: 'assets/svg/PDF to Text.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['pdf'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertPdfToTxt(filePath);
                        },
                        title: 'PDF to Text',
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'PDF to HTML',
                  svg: 'assets/svg/PDF to HTML.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => DragDropDialog(
                        fileTypeExtension: const ['pdf'],
                        callBack: (String filePath) {
                          context.read<ConversionCubit>().convertPdfToHtml(filePath);
                        },
                        title: 'PDF to HTML',
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
