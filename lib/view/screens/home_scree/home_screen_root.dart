import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/view/screens/home_scree/widgets/convert_to_pdf.dart';
import 'package:pdf_to_word/view/screens/home_scree/widgets/home.dart';
import 'package:pdf_to_word/view/shared/drawer_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PDF TO WORD", style: TextStyle(fontSize: 18, color: Colors.black)),
            Text("CONVERTER", style: TextStyle(fontSize: 12, color: Colors.grey)),
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
                      DrawerItem(
                        svg: 'assets/svg/home icon.svg',
                        label: 'Home',
                        onTap: () {
                          pageController.jumpToPage(0);
                          print(_currentPageIndex);
                        },
                      ),
                      DrawerItem(
                        svg: 'assets/svg/convert to pdf.svg',
                        label: 'Convert To PDF',
                        onTap: () {
                          pageController.jumpToPage(1);
                          print(_currentPageIndex);

                        },
                      ),
                      DrawerItem(
                        svg: 'assets/svg/convert from pdf.svg',
                        label: 'Convert From PDF',
                        onTap: () {
                          pageController.jumpToPage(2);
                          print(_currentPageIndex);

                        },
                      ),
                      DrawerItem(
                        svg: 'assets/svg/PDF editor.svg',
                        label: 'PDF Editor',
                        onTap: () {
                          pageController.jumpToPage(3);
                          print(_currentPageIndex);

                        },
                      ),
                      DrawerItem(
                        svg: 'assets/svg/PDF tools.svg',
                        label: 'PDF Tools',
                        onTap: () {
                          pageController.jumpToPage(4);
                          print(_currentPageIndex);

                        },
                      ),
                      DrawerItem(
                        svg: 'assets/svg/rate us.svg',
                        label: 'Rate Us',
                        onTap: () {},
                      ),
                      DrawerItem(
                        svg: 'assets/svg/Support.svg',
                        label: 'Support',
                        onTap: () {},
                      ),
                      DrawerItem(
                        svg: 'assets/svg/restore_purchase.svg',
                        label: 'Restore Purchase',
                        onTap: () {},
                      ),
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
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          10.horizontalSpace,
                          SvgPicture.asset(
                            'assets/svg/pro icon.svg',
                            width: 40,
                            height: 40,
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
            // width: 0.7.sw,
            // height: 0.9.sh,
            child: PageView(
              // pageSnapping: false,
              // physics: NeverScrollableScrollPhysics(),
              onPageChanged: (newPage) {
                _currentPageIndex = newPage;
                setState(() {});
              },
              scrollDirection: Axis.vertical,
              controller: pageController,
              children: [
                Home(),
                ConvertToPdf(),
                Container(
                  width: 25,
                  height: 25,
                  color: Colors.grey,
                ),
                Container(
                  width: 25,
                  height: 25,
                  color: Colors.green,
                ),
                Container(
                  width: 25,
                  height: 25,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
