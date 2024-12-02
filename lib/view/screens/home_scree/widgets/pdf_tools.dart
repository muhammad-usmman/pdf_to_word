import 'package:flutter/material.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_drop_dialog.dart';
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
                  onTap: () {},
                ),
                ToolCard(
                  label: 'Unlock PDF',
                  svg: 'assets/svg/Unlock PDF.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'Split PDF',
                  svg: 'assets/svg/Split PDF.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'Merge PDF',
                  svg: 'assets/svg/Merge PDF.svg',
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) => const DragDropDialog(fileTypeExtension: ['pdf'],),
                    // );
                  },
                ),
                ToolCard(
                  label: 'Delete Pages',
                  svg: 'assets/svg/Delete Page.svg',
                  onTap: () {},
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
