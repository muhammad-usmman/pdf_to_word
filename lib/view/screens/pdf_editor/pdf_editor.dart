import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/controller/cubits/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';
import 'package:pdf_to_word/view/screens/pdf_editor/widgets/button.dart';

class PDFEditor extends StatefulWidget {
  const PDFEditor({super.key});

  @override
  State<PDFEditor> createState() => _PDFEditorState();
}

class _PDFEditorState extends State<PDFEditor> {
  PageController pageController = PageController();
  int _currentPageIndex = 0;
  double sliderValue = 50; // Initial slider value

  void _increment() {
    setState(() {
      sliderValue = (sliderValue + 10).clamp(0, 100);
    });
  }

  void _decrement() {
    setState(() {
      sliderValue = (sliderValue - 10).clamp(0, 100);
    });
  }

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
          TextButton(
            child: const Text(
              'Upload',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black1),
            ),
            onPressed: () {},
          ),
          5.horizontalSpace,
          TextButton(
            child: const Text(
              'Lord Url',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black1),
            ),
            onPressed: () {},
          ),
          5.horizontalSpace,
          TextButton(
            child: const Text(
              'Register',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black1),
            ),
            onPressed: () {},
          ),
          5.horizontalSpace,
          TextButton(
            child: const Text(
              'Report Bug',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black1),
            ),
            onPressed: () {},
          ),
          5.horizontalSpace,
        ],
         elevation: 0,
      ),
       body: Column(
        children: [
          Container(
            height: 100,
            color:   context.read<ThemeCubit>().state.themeData == AppThemes.light? const Color(0xFFE8E8E8):const Color(0xff242424),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/EDIT.svg'),
                      15.horizontalSpace,
                      SvgPicture.asset('assets/svg/Add comment.svg'),
                      15.horizontalSpace,
                      SvgPicture.asset('assets/svg/PAN.svg'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/Vector.svg'),
                      5.horizontalSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 45),
                        child: VerticalDivider(
                          width: 1.5,
                          color: const Color(0xff1E1E1E).withOpacity(0.65),
                        ),
                      ),
                      5.horizontalSpace,
                      SvgPicture.asset('assets/svg/Group.svg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration:   BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(context.read<ThemeCubit>().state.themeData == AppThemes.light?'assets/svg/BG.png':'assets/svg/black bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 0.3.sw,
                      height: 0.8.sh,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            // Shadow color with transparency
                            blurRadius: 8,
                            // Softens the shadow
                            spreadRadius: 1,
                            // Extends the shadow slightly
                            offset: const Offset(
                                1.5, 1.5), // Position of the shadow (horizontal, vertical)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: context.read<ThemeCubit>().state.themeData == AppThemes.light?Colors.white:Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    bottom: 35,
                    left: 0,
                    child: Container(
                      width: 125,
                      decoration:   BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                        gradient:   LinearGradient(colors: context.read<ThemeCubit>().state.themeData == AppThemes.light?[
                          AppColors.red1,
                          AppColors.red,
                          AppColors.red1,
                        ]:[
                          const Color(0xFF303030),
                          const Color(0xFF303030),
                        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                      ),
                      // padding: const EdgeInsets.symmetric(vertical: 35),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Button(
                                onTap: () {
                                  pageController.jumpToPage(0);
                                  log(_currentPageIndex.toString());
                                },
                                icon: 'assets/svg/ICON.svg'),
                            Button(
                                onTap: () {
                                  pageController.jumpToPage(1);
                                  log(_currentPageIndex.toString());
                                },
                                icon: 'assets/svg/Add text.svg'),
                            Button(
                                onTap: () {
                                  pageController.jumpToPage(2);
                                  log(_currentPageIndex.toString());
                                },
                                icon: 'assets/svg/Icon3.svg'),
                            Button(
                                onTap: () {
                                  pageController.jumpToPage(3);
                                  log(_currentPageIndex.toString());
                                },
                                icon: 'assets/svg/Number.svg'),
                            Button(
                                onTap: () {
                                  pageController.jumpToPage(4);
                                  log(_currentPageIndex.toString());
                                },
                                icon: 'assets/svg/page bookmark.svg'),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                              child: Divider(
                                height: 1.5,
                                thickness: 1.5,
                                color: Color(0xffe06868),
                              ),
                            ),
                            Button(onTap: () {}, icon: 'assets/svg/save.svg'),
                            Button(onTap: () {}, icon: 'assets/svg/dOWNLOAD.svg'),
                            Button(onTap: () {}, icon: 'assets/svg/PRINT.svg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 150,
                    bottom: 35,
                    child: SizedBox(
                      width: 0.25.sw,
                      // height: 0.8.sh,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        onPageChanged: (newPage) {
                          _currentPageIndex = newPage;
                          setState(() {});
                        },
                        children: const [
                          // Container(color: AppColors.grey,),
                          First(),
                          Second(),
                          Third(),
                          Fourth(),
                          Bookmarks()
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 95,
                    bottom: 94,
                    right: 0,
                    child: Container(
                      width: 120,
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 59,
                            height: 59,
                            color: Colors.white12,
                            child: const Center(
                                child: Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                            )),
                          ),
                          const Text(
                            '6',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Container(
                            width: 59,
                            height: 59,
                            color: Colors.white12,
                            child: const Center(
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: 59,
                            height: 59,
                            color: Colors.white12,
                            child: const Center(
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Divider(
                              height: 1.5,
                              thickness: 1.5,
                              color: Colors.white70,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                                    padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                                icon: const Icon(Icons.add),
                                onPressed: _increment,
                                color: Colors.black,
                                padding: EdgeInsets.zero,
                                // Remove default padding
                                constraints: const BoxConstraints(), // Remove default constraints
                              ),
                              RotatedBox(
                                quarterTurns: 3,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 2,
                                    thumbColor: Colors.white,
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: Colors.white54,
                                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                                  ),
                                  child: Slider(
                                    value: sliderValue,
                                    min: 0,
                                    max: 100,
                                    onChanged: (value) {
                                      setState(() {
                                        sliderValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: _decrement,
                                color: Colors.black,
                                padding: EdgeInsets.zero,
                                // Remove default padding
                                constraints: const BoxConstraints(),
                                // Remove default constraints
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                                    padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                              ),
                              20.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${sliderValue.toStringAsFixed(0)}%',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                  5.horizontalSpace,
                                  const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 75,
          height: 0.45.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          gradient:   LinearGradient(colors: context.read<ThemeCubit>().state.themeData == AppThemes.light?[
            AppColors.red1,
            AppColors.red,
            AppColors.red1,
          ]:[
            const Color(0xFF303030),
            const Color(0xFF303030),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          // padding: const EdgeInsets.symmetric(vertical: 35),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Button(
                  onTap: () {},
                  icon: 'assets/svg/Vectortext.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/Vectorbrush.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/image.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/Draw.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/link.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/form field.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 75,
          height: 0.45.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient:   LinearGradient(colors: context.read<ThemeCubit>().state.themeData == AppThemes.light?[
              AppColors.red1,
              AppColors.red,
              AppColors.red1,
            ]:[
              const Color(0xFF303030),
              const Color(0xFF303030),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          // padding: const EdgeInsets.symmetric(vertical: 35),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Button(
                  onTap: () {},
                  icon: 'assets/svg/sticky notes.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/Highlight.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/insert.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/Strike.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/underline.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/Shapes.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 210.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 75,
          height: 0.45.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient:   LinearGradient(colors: context.read<ThemeCubit>().state.themeData == AppThemes.light?[
              AppColors.red1,
              AppColors.red,
              AppColors.red1,
            ]:[
              const Color(0xFF303030),
              const Color(0xFF303030),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          // padding: const EdgeInsets.symmetric(vertical: 35),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Button(
                  onTap: () {},
                  icon: 'assets/svg/MOVE.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/Delete.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/left rotate.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/right rotate.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/Append text.svg',
                  bottomLine: true,
                ),
                Button(
                  onTap: () {},
                  icon: 'assets/svg/CROP.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class Fourth extends StatefulWidget {
  const Fourth({super.key});

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
  final ScrollController _scrollController = ScrollController();
int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topLeft,
      child: Container(
        // color: Colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: 0.15.sw,
         child: Scrollbar(
           controller: _scrollController,
           thumbVisibility: true,
           thickness: 1.5,
           radius: const Radius.circular(10),
           trackVisibility: true,
             interactive: true,
             // trackColor: WidgetStatePropertyAll(Colors.red.shade100),
           // thumbColor: WidgetStatePropertyAll(Colors.red),
           child: ListView.builder(
             controller: _scrollController,
            itemCount: 10,
              itemBuilder: (context, index) {
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              currentIndex = index;

                            });
                          },
                          child: Container(
                          width: 200,
                          height: 300,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,

                            border: currentIndex == index?Border.all(color: Colors.red, width: 2):null,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                // Shadow color with transparency
                                blurRadius: 1,
                                // Softens the shadow
                                spreadRadius: 1,
                                // Extends the shadow slightly
                                offset: const Offset(
                                    0, 0), // Position of the shadow (horizontal, vertical)
                              ),
                            ],

                          ),
                          child: Center(child: Text('Page ${index + 1}')),
                                                ),
                        ),
                      // Page number
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('${index + 1}'),
                      ),
                    ],
                  ),
                  if(currentIndex == index)
                  Positioned(
                    right: 15,
                    top: 10,
                    child: Container(
                      width: 52,
           
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient:   LinearGradient(colors: context.read<ThemeCubit>().state.themeData == AppThemes.light?[
                          AppColors.red1,
                          AppColors.red,
                          AppColors.red1,
                        ]:[
                          const Color(0xFF303030),
                          const Color(0xFF303030),
                        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                      ),
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              // Delete action
                            },
                            color: Colors.red,
                            padding: const EdgeInsets.all(4),
                            iconSize: 20,
                          ),
                          IconButton(
                            icon: const Icon(Icons.refresh, color: Colors.white),
                            onPressed: () {
                              // Refresh action
                            },
                            color: Colors.red,
                            padding: const EdgeInsets.all(4),
                            iconSize: 20,
                          ),
                          IconButton(
                            icon: const Icon(Icons.rotate_left, color: Colors.white),
                            onPressed: () {
                              // Rotate action
                            },
                            color: Colors.red,
                            padding: const EdgeInsets.all(4),
                            iconSize: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
                   ),
         ),
      ),
    );
  }
}


class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200, // Background color similar to the image
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "Bookmarks",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Spacer(), // Pushes the icon and text to the center
          SvgPicture.asset('assets/svg/Add Bookmark.svg'),
          const SizedBox(height: 10),
          const Text(
            "No Bookmarks Found",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const Spacer(), // Adds space below the content
        ],
      ),
    );
  }
}
