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
}
