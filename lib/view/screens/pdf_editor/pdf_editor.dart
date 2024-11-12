import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_to_word/utils/colors.dart';

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
                      const Icon(Icons.edit,color: Color(0xff888888),),
                      15.horizontalSpace,
                      const Icon(Icons.add_comment_outlined,color: Color(0xff888888),),
                      15.horizontalSpace,
                      const Icon(Icons.back_hand,color: Color(0xff888888),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      const Icon(Icons.edit,color: Color(0xff888888),),
                      15.horizontalSpace,
                      const Icon(Icons.add_comment_outlined,color: Color(0xff888888),),
                      15.horizontalSpace,
                      const Icon(Icons.back_hand,color: Color(0xff888888),),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
