import 'package:flutter/material.dart';
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
                  svg: 'assets/svg/JPG to PDF.svg',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const DragDropDialog(),
                    );
                  },
                ),
                ToolCard(
                  label: 'Image to PDF',
                  svg: 'assets/svg/JPG to PDF (1).svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'PPT to PDF',
                  svg: 'assets/svg/PPT to PDF.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'BMP to PDF',
                  svg: 'assets/svg/BMP to PDF.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'assets/svg/Word to PDF.svg',
                  svg: 'assets/svg/Excel to PDF.svg',
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
