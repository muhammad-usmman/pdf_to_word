import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';
import 'package:pdf_to_word/view/screens/edit_images/widgets/options_tile.dart';
import 'package:pdf_to_word/view/shared/custom_app_bar.dart';
import 'package:pdf_to_word/view/shared/custom_button.dart';

class EditImages extends StatefulWidget {
  final List<String> fileUrls;
  final List<String> fileNames;

  const EditImages({
    super.key,
    required this.fileUrls,
    required this.fileNames,
  });

  static MaterialPageRoute<void> route(List<String> fileUrls, List<String> fileNames) =>
      MaterialPageRoute(
        builder: (_) => EditImages(
          fileUrls: fileUrls,
          fileNames: fileNames,
        ),
      );

  @override
  State<EditImages> createState() => _EditImagesState();
}

class _EditImagesState extends State<EditImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(leading: SizedBox.shrink(),),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          color: context.read<ThemeCubit>().state.themeData == AppThemes.light
              ? Colors.transparent
              : Colors.black,
          image: DecorationImage(
            image: AssetImage(context.read<ThemeCubit>().state.themeData == AppThemes.light
                ? 'assets/svg/BG.png'
                : 'assets/svg/black bg.png'),
            filterQuality: FilterQuality.high,
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title

            Container(
              width: 0.3.sw,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.65),
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: context.read<ThemeCubit>().state.themeData == AppThemes.light
                    ? Colors.white.withOpacity(0.8)
                    : const Color(0xff333333),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                    child: Text(
                      'Image To PDF Options',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Divider(),
                  const Text(
                    'Page Orientation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OptionButton(
                        text: 'Landscape',
                        isSelected: false,
                        onTap: () {
                          // Handle orientation change
                        },
                        width: 210,
                        height: 126,
                        img: 'assets/svg/landscape.svg',
                      ),
                      OptionButton(
                        text: 'Portrait',
                        isSelected: true,
                        width: 210,
                        height: 126,
                        onTap: () {
                          // Handle orientation change
                        },
                        img: 'assets/svg/potrait.svg',
                      ),
                    ],
                  ),
                  const Text(
                    'Page Size',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    color: context.read<ThemeCubit>().state.themeData == AppThemes.light
                        ? Colors.white
                        : AppColors.black1,
                    child: DropdownButtonFormField<String>(
                      value: 'A4 (297 x 210 mm)',
                      items: [
                        'A4 (297 x 210 mm)',
                        'A5 (148 x 210 mm)',
                        'Letter (8.5 x 11 in)',
                      ]
                          .map((size) => DropdownMenuItem(
                                value: size,
                                child: Text(size),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // Handle page size change
                      },
                      decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent )),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent )),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent )),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent )),
                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent )),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      ),
                    ),
                  ),
                  const Text(
                    'Margin',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OptionButton(
                        text: 'No Margin',
                        isSelected: true,
                        width: 134.36,
                        height: 134.36,
                        onTap: () {
                          // Handle margin change
                        },
                        img: 'assets/svg/No margin.svg',
                      ),
                      OptionButton(
                        text: 'Small',
                        isSelected: false,
                        width: 134.36,
                        height: 134.36,
                        onTap: () {
                          // Handle margin change
                        },
                        img: 'assets/svg/small.svg',
                      ),
                      OptionButton(
                        text: 'Big',
                        isSelected: false,
                        width: 134.36,
                        height: 134.36,
                        onTap: () {
                          // Handle margin change
                        },
                        img: 'assets/svg/BIG MARGIN.svg',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          // Handle checkbox toggle
                        },
                      ),
                      const Text('Merge all Images in One PDF'),
                    ],
                  ),
                  CustomButton(
                      title: 'Convert to PDF', onTap: () {}, height: 0.05.sh, width: 0.35.sw),
                ],
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 0.25.sw,
                    height: 0.55.sh,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 01,
                          spreadRadius: 01,
                          offset: const Offset(-1, -1),
                        ),
                      ],
                      color: context.read<ThemeCubit>().state.themeData == AppThemes.light
                          ? Colors.white
                          : const Color(0xff333333),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
