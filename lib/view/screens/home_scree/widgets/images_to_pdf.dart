import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_to_word/controller/cubits/conversion_cubit/conversion_cubit.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/drag_and_drop_multiple_files.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/widget/custom_drop_down.dart';
import 'package:pdf_to_word/view/screens/drag_drop_dialog/widget/input_field.dart';

class ImagesToPdf extends StatefulWidget {
  const ImagesToPdf({super.key});

  @override
  State<ImagesToPdf> createState() => _ImagesToPdfState();
}

class _ImagesToPdfState extends State<ImagesToPdf> {
  TextEditingController marginHorizontalController = TextEditingController(text: '0');
  TextEditingController marginVerticalController = TextEditingController(text: '0');
  String pageSize = 'default';
  String pageOrientation = 'default';


  @override
  void dispose() {
    marginHorizontalController.dispose();
    marginVerticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DragDropDialogMultipleFiles(
      addCustomUI: true,
      customUi: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox  (
                          // width: 0.2.sw,
                          height:   0.055.sh,
                          child: InputField(
                            textInputType: TextInputType.number,
                            controller: marginVerticalController,
                            title: "Margin Vertically",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Set the page vertical margin in millimeters (mm).',
                             style: const TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(
                          // width: 0.2.sw,
                          height:   0.055.sh,
                          child: InputField(
                            textInputType: TextInputType.number,
                            controller: marginHorizontalController,
                            title: "Margin Horizontally",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Set the page horizontal margin in millimeters (mm).",
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Page Size',
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 15),
                          ),
                        ),
                        CustomDropDown(
                          value: pageSize,
                          items: [
                            'default',
                            'a0',
                            'a1',
                            'a2',
                            'a3',
                            'a4',
                            'a5',
                            'a6',
                            'a7',
                            'a8',
                            'a9',
                            'a10',
                            'letter',
                            'legal',
                          ],
                          onChanged: (String? selectedValue) {
                            pageSize = selectedValue ?? 'default';
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'The property scales each image to fit a given page size.',
                            maxLines: 5,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                     
                       children: [
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "PageOrientation",
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 15),
                          ),
                                           ),
                                           CustomDropDown(
                          value: pageOrientation,
                          items: [
                            'default',
                            'portrait',
                            'landscape',
                          ],
                          onChanged: (String? selectedValue) {
                            setState(() {
                              pageOrientation = selectedValue ?? 'default';
                            });
                          },
                                           ),
                                           Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            // width: 250,
                            height: 40,
                            child: Text(
                              'Set page orientation. Works only with the PageSize property when it is set to a value other than the Image size(default).',
                              maxLines: 5,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 10),
                            ),
                          ),
                                           ),
                       ],
                     ),
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
      fileTypeExtension: const [
        'jpg',
        'png',
        'jpeg',
        'gif',
        'tiff',
        'webp',
        'heic',
        'svg',
        'psd'
      ],
      callBack: (List<String> filePath) {
        // Navigator.push(context, EditImages.route([],[]));
        context.read<ConversionCubit>().convertImagesToPdf(
            filePath,
            marginVerticalController.text,
            marginHorizontalController.text,
            pageSize,
            pageOrientation);
      },
      title: 'Image to Pdf',
    );
  }
}
