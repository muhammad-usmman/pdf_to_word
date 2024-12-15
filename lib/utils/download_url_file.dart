import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_to_word/utils/toast_helper.dart';

class DownloadFileUrl {
  static Future<void>   downloadFile( String fileName, String fileUrl, BuildContext context) async {
    Directory? directory = await getDownloadsDirectory();
    if(directory != null) {
      String path = directory.path;
    try {
      final pdfResponse = await http.get(Uri.parse(fileUrl));

        final outputPath = '$path/$fileName';

        final file = File(outputPath);
        await file.writeAsBytes(pdfResponse.bodyBytes);


        ToastHelper.success(context, 'File Downloaded');

     } catch (e) {
      print(e);
      ToastHelper.warning(context, 'File Downloading Failed','');

    }
    try {
      OpenFile.open('$path/$fileName');
    }catch(e){
      print(e);
      ToastHelper.warning(context, 'Failed to open file. Check your Downloads','');
    }
    }
  }
  static Future<void> downloadMultipleFiles(
        List<String> fileNames, List<String> fileUrls, BuildContext context) async {
     if (fileNames.length != fileUrls.length) {
      ToastHelper.warning(context, 'File names and URLs count mismatch', '');
      return;
    }
     Directory? directory = await getDownloadsDirectory();

    for (int i = 0; i < fileUrls.length; i++) {
      try {
        final fileUrl = fileUrls[i];
        final fileName = fileNames[i];
        log(fileName);
        log(fileUrl);
        final pdfResponse = await http.get(Uri.parse(fileUrl));

        if (pdfResponse.statusCode == 200) {
          if(directory != null) {
            String path = directory.path;

            final outputPath = '$path/$fileName';
            final file = File(outputPath);

            await file.writeAsBytes(pdfResponse.bodyBytes);
            ToastHelper.success(context, 'Downloaded: $fileName');
            OpenFile.open('$path/$fileName');

          }
        } else {
          ToastHelper.warning(context, 'Failed to download: $fileName', '');
        }
      } catch (e) {
        ToastHelper.warning(context, 'Error downloading $fileNames: $e', '');
      }
    }
  }

}
