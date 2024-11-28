import 'package:flutter/material.dart';
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
                      builder: (BuildContext context) => const DragDropDialog(
                        fileTypeExtension: [
                          'jpg',
                          'jpeg',
                          'gif',
                          'tiff',
                          'webp',
                          'heic',
                          'svg',
                          'psd'
                        ],
                      ),
                    );
                  },
                ),
                ToolCard(
                  label: 'Image to Text',
                  svg: 'assets/svg/IMAGE to text.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'PNG to JPG',
                  svg: 'assets/svg/png to jpg.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'GIF to JPG',
                  svg: 'assets/svg/gif to jpg.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'JPG to PNG',
                  svg: 'assets/svg/jpg to png.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'GIF to PNG',
                  svg: 'assets/svg/gif to png.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'PPT to ZIP',
                  svg: 'assets/svg/PPT TO ZIP.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'Text to ZIP',
                  svg: 'assets/svg/TXT TO ZIP.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'Image to ZIP',
                  svg: 'assets/svg/IMG to ZIP.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'Word to ZIP',
                  svg: 'assets/svg/Word to ZIP.svg',
                  onTap: () {},
                ),
                ToolCard(
                  label: 'PDF to ZIP',
                  svg: 'assets/svg/PDF to ZIP.svg',
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
