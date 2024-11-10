import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/view/shared/custom_button.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class DragDropDialog extends StatelessWidget {
  const DragDropDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 0.8.sw,
        height: 0.7.sh,
        child: Stack(
          children: [
            // Main Card Container

            Positioned.fill(
              child: Container(
                width: 0.8.sw,
                height: 0.6.sh,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/dragnDropBg.png'),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title
                    5.verticalSpace,
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Image to PDF",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // File Upload Area
                    Container(
                      width: 0.45.sw,
                      height: 0.45.sh,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            // Shadow color with transparency
                            blurRadius: 8,
                            // Softens the shadow
                            spreadRadius: 1,
                            // Extends the shadow slightly
                            offset: const Offset(0,
                                4), // Position of the shadow (horizontal, vertical)
                          ),
                        ],
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropRegion(
                        // Formats this region can accept.
                        formats: const [Formats.png,Formats.jpeg,],
                        hitTestBehavior: HitTestBehavior.opaque,
                        onDropOver: (event) {
                          // You can inspect local data here, as well as formats of each item.
                          // However on certain platforms (mobile / web) the actual data is
                          // only available when the drop is accepted (onPerformDrop).
                          final item = event.session.items.first;
                          if (item.localData is Map) {
                            // This is a drag within the app and has custom local data set.
                          }
                          if (item.canProvide(Formats.plainText)) {
                            // this item contains plain text.
                          }
                          // This drop region only supports copy operation.
                          if (event.session.allowedOperations.contains(DropOperation.copy)) {
                            return DropOperation.copy;
                          } else {
                            return DropOperation.none;
                          }
                        },
                        onDropEnter: (event) {
                          // This is called when region first accepts a drag. You can use this
                          // to display a visual indicator that the drop is allowed.
                        },
                        onDropLeave: (event) {
                          // Called when drag leaves the region. Will also be called after
                          // drag completion.
                          // This is a good place to remove any visual indicators.
                        },
                        onPerformDrop: (event) async {
                          // Called when user dropped the item. You can now request the data.
                          // Note that data must be requested before the performDrop callback
                          // is over.
                          final item = event.session.items.first;

                          // data reader is available now
                          final reader = item.dataReader!;
                          if (reader.canProvide(Formats.plainText)) {
                            reader.getValue<String>(Formats.plainText, (value) {
                              if (value != null) {
                                // You can access values through the `value` property.
                                print('Dropped text: ${value}');
                              }
                            }, onError: (error) {
                              print('Error reading value $error');
                            });
                          }

                          if (reader.canProvide(Formats.png)) {
                            reader.getFile(Formats.png, (file) {
                              // Binary files may be too large to be loaded in memory and thus
                              // are exposed as stream.
                              final stream = file.getStream();

                              // Alternatively, if you know that that the value is small enough,
                              // you can read the entire value into memory:
                              // (note that readAll is mutually exclusive with getStream(), you
                              // can only use one of them)
                              // final data = file.readAll();
                            }, onError: (error) {
                              print('Error reading value $error');
                            });
                          }
                        },
                        child: DottedBorder(
                          dashPattern: const [8, 8],
                          radius: const Radius.circular(8),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Placeholder for an upload icon/image
                                SvgPicture.asset('assets/svg/Upload.svg'),
                                const SizedBox(height: 16),
                                const Text(
                                  "Drag & Drop File Here",
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 24),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      height: 0.8,
                                      width: 100,// Height of the divider line
                                      color: AppColors.grey,    // Color of the divider
                                    ),
                                    Text(
                                      "OR",
                                      style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w600,fontSize: 26),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      height: 0.8,
                                      width: 100,// Height of the divider line
                                      color: AppColors.grey,    // Color of the divider
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                CustomButton(
                                  onTap: () {
                                    // Add your file browsing logic here
                                  },
                                  title: "Browse Files",
                                  height: 0.07.sh,
                                  width: 0.2.sw,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),

            Positioned(
              right: 28,
              top: 25,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
