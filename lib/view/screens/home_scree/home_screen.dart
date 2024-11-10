import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
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
                    children: [
                      const DrawerItem(
                          svg: 'assets/svg/home icon.svg', label: 'Home'),
                      const DrawerItem(
                          svg: 'assets/svg/convert to pdf.svg',
                          label: 'Convert To PDF'),
                      const DrawerItem(
                          svg: 'assets/svg/convert from pdf.svg',
                          label: 'Convert From PDF'),
                      const DrawerItem(
                          svg: 'assets/svg/PDF editor.svg',
                          label: 'PDF Editor'),
                      const DrawerItem(
                          svg: 'assets/svg/PDF tools.svg', label: 'PDF Tools'),
                      const DrawerItem(
                          svg: 'assets/svg/rate us.svg', label: 'Rate Us'),
                      const DrawerItem(
                          svg: 'assets/svg/Support.svg', label: 'Support'),
                      const DrawerItem(
                          svg: 'assets/svg/restore_purchase.svg',
                          label: 'Restore Purchase'),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Upgrade to Pro"),
                        SizedBox(width: 8),
                        Icon(Icons.workspace_premium, color: Colors.amber),
                      ],
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
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: const [
                        ToolCard(label: 'Image to PDF'),
                        ToolCard(label: 'Image to Text'),
                        ToolCard(label: 'PNG to JPG'),
                        ToolCard(label: 'GIF to JPG'),
                        ToolCard(label: 'JPG to PNG'),
                        ToolCard(label: 'GIF to PNG'),
                        ToolCard(label: 'PPT to ZIP'),
                        ToolCard(label: 'Text to ZIP'),
                        ToolCard(label: 'Image to ZIP'),
                        ToolCard(label: 'Word to ZIP'),
                        ToolCard(label: 'PDF to ZIP'),
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

  const ToolCard({required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Placeholder(fallbackHeight: 50, fallbackWidth: 50),
          const SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
