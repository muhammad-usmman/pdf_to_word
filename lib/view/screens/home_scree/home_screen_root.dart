import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/controller/cubits/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/prefrences/user_prefs.dart';
 import 'package:pdf_to_word/view/screens/home_scree/widgets/convert_from_pdf.dart';
import 'package:pdf_to_word/view/screens/home_scree/widgets/convert_to_pdf.dart';
import 'package:pdf_to_word/view/screens/home_scree/widgets/home.dart';
import 'package:pdf_to_word/view/screens/home_scree/widgets/pdf_tools.dart';
import 'package:pdf_to_word/view/screens/pdf_editor/pdf_editor.dart';
import 'package:pdf_to_word/view/shared/drawer_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int _currentPageIndex = 0;
  ValueNotifier<bool> whiteTheme = ValueNotifier<bool>(UserPrefs.getTheme());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PDF TO WORD", style: TextStyle(fontSize: 18, )),
            Text("CONVERTER", style: TextStyle(fontSize: 12, )),
          ],
        ),
        actions: [

          Center(
            child: AdvancedSwitch(
              onChanged: (value) {
                // The value is the updated state of the switch (true/false)
                whiteTheme.value = value;
                context.read<ThemeCubit>().toggleTheme();
              },                width: 42.0,
              height: 22.0,
              disabledOpacity: 1.0,
              activeColor: AppColors.red,
              inactiveColor: Colors.white54,
              controller: whiteTheme,
              borderRadius: BorderRadius.circular(50.0),
              thumb: Center(
                child: Container(
                  height: 24.0,
                  width: 24.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          )  ,
          15.horizontalSpace,
          InkWell(
            child: Container(
                width: 45,
                height: 45,decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.red,
            ),

                child: Center(child: SvgPicture.asset('assets/svg/language.svg'))),
            onTap: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Row(
        children: [
          Container(
            width: 350,
            // Adjust width as needed
            color: Theme.of(context).primaryColor,
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
                          // pageController.jumpToPage(3);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const PDFEditor(),
                            ),
                          );
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
                        color: Theme.of(context).cardTheme.color?.withOpacity(0.9) ??Theme.of(context).cardTheme.color,
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
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (newPage) {
                _currentPageIndex = newPage;
                setState(() {});
              },
              scrollDirection: Axis.vertical,
              controller: pageController,
              children: const [
                Home(),
                ConvertToPdf(),
                ConvertFromPdf(),
                SizedBox.shrink(),
                PDFTools(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
