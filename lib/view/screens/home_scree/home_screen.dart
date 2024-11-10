import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PDF TO WORD",
                style: TextStyle(fontSize: 18, color: Colors.black)),
            Text("CONVERTER",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.toggle_on_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.language, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Row(
        children: [
          Container(
            width: 350,
            // Adjust width as needed
            color: Colors.red.shade700,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: const [
                      DrawerItem(
                          svg: 'assets/svg/home icon.svg', label: 'Home'),
                      DrawerItem(
                          svg: 'assets/svg/convert to pdf.svg',
                          label: 'Convert To PDF'),
                      DrawerItem(
                          svg: 'assets/svg/convert from pdf.svg',
                          label: 'Convert From PDF'),
                      DrawerItem(
                          svg: 'assets/svg/PDF editor.svg',
                          label: 'PDF Editor'),
                      DrawerItem(
                          svg: 'assets/svg/PDF tools.svg', label: 'PDF Tools'),
                      DrawerItem(
                          svg: 'assets/svg/rate us.svg', label: 'Rate Us'),
                      DrawerItem(
                          svg: 'assets/svg/Support.svg', label: 'Support'),
                      DrawerItem(
                          svg: 'assets/svg/restore_purchase.svg',
                          label: 'Restore Purchase'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Upgrade to Pro",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          10.horizontalSpace,
                          SvgPicture.asset(
                            'assets/svg/pro icon.svg',
                            width: 40,height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      crossAxisCount: 6,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      children: const [
                        ToolCard(
                          label: 'Image to PDF',
                          svg: 'assets/svg/JPG to PDF.svg',
                        ),
                        ToolCard(
                          label: 'Image to Text',
                          svg: 'assets/svg/IMAGE to text.svg',
                        ),
                        ToolCard(
                          label: 'PNG to JPG',
                          svg: 'assets/svg/png to jpg.svg',
                        ),
                        ToolCard(
                          label: 'GIF to JPG',
                          svg: 'assets/svg/gif to jpg.svg',
                        ),
                        ToolCard(
                          label: 'JPG to PNG',
                          svg: 'assets/svg/jpg to png.svg',
                        ),
                        ToolCard(
                          label: 'GIF to PNG',
                          svg: 'assets/svg/gif to png.svg',
                        ),
                        ToolCard(
                          label: 'PPT to ZIP',
                          svg: 'assets/svg/PPT TO ZIP.svg',
                        ),
                        ToolCard(
                          label: 'Text to ZIP',
                          svg: 'assets/svg/TXT TO ZIP.svg',
                        ),
                        ToolCard(
                          label: 'Image to ZIP',
                          svg: 'assets/svg/IMG to ZIP.svg',
                        ),
                        ToolCard(
                          label: 'Word to ZIP',
                          svg: 'assets/svg/Word to ZIP.svg',
                        ),
                        ToolCard(
                          label: 'PDF to ZIP',
                          svg: 'assets/svg/PDF to ZIP.svg',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String svg;
  final String label;

  const DrawerItem({required this.label, required this.svg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Colors.white.withOpacity(0.3)))),
        child: Row(
          children: [
            SvgPicture.asset(svg),
            5.horizontalSpace,
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class ToolCard extends StatelessWidget {
  final String label;
  final String svg;

  const ToolCard({super.key, required this.label, required this.svg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                svg,
                height: 80,
                width: 80,
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
