import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_drop_dialog.dart';
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const DragDropDialog(fileTypeExtension:['pdf'],),
                    );
                  },
                ),
                ToolCard(
                  label: 'PDF to JPG',
                  svg: 'assets/svg/PDF to Image.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const DragDropDialog(fileTypeExtension:['pdf'],),
                    );
                  },
                ),
                ToolCard(
                  label: 'PDF to Text',
                  svg: 'assets/svg/PDF to Text.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const DragDropDialog(fileTypeExtension:['pdf'],),
                    );
                  },
                ),
                ToolCard(
                  label: 'PDF to HTML',
                  svg: 'assets/svg/PDF to HTML.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const DragDropDialog(fileTypeExtension:['pdf'],),
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
