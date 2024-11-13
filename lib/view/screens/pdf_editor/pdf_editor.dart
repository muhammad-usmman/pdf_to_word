import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/view/screens/pdf_editor/widgets/button.dart';

class PDFEditor extends StatelessWidget {
  const PDFEditor({super.key});

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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100,
            color: const Color(0xFFE8E8E8),
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
              decoration: const BoxDecoration(
                  color: Colors.orange,
                  image:
                      DecorationImage(image: AssetImage('assets/svg/BG.png'), fit: BoxFit.cover)),
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    bottom: 35,
                    left: 0,
                    child: Container(
                      width: 125,
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 35),
                      child: Column(
                        children: [
                          Button(onTap: (){}, icon: Icons.add)
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
