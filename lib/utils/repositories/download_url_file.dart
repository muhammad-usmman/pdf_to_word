import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_to_word/utils/toast_helper.dart';

class DownloadFileUrl {
  static Future<void> downloadFile(String outputDir, String fileName, String fileUrl, BuildContext context) async {
    try {
      final pdfResponse = await http.get(Uri.parse(fileUrl));
      final outputPath = '$outputDir/$fileName';

      final file = File(outputPath);
      await file.writeAsBytes(pdfResponse.bodyBytes);
      ToastHelper.success(context, 'File Downloaded');
     } catch (e) {
      ToastHelper.warning(context, 'File Downloading Failed','');

    }
  }
  static Future<void> downloadMultipleFiles(
      String outputDir, List<String> fileNames, List<String> fileUrls, BuildContext context) async {
    if (fileNames.length != fileUrls.length) {
      ToastHelper.warning(context, 'File names and URLs count mismatch', '');
      return;
    }

    for (int i = 0; i < fileUrls.length; i++) {
      try {
        final fileUrl = fileUrls[i];
        final fileName = fileNames[i];
        log(fileName);
        log(fileUrl);
        final pdfResponse = await http.get(Uri.parse(fileUrl));

        if (pdfResponse.statusCode == 200) {
          final outputPath = '$outputDir/$fileName';
          final file = File(outputPath);

          await file.writeAsBytes(pdfResponse.bodyBytes);
          ToastHelper.success(context, 'Downloaded: $fileName');
        } else {
          ToastHelper.warning(context, 'Failed to download: $fileName', '');
        }
      } catch (e) {
        ToastHelper.warning(context, 'Error downloading $fileNames: $e', '');
      }
    }
  }

}
