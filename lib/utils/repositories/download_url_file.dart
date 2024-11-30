import 'dart:io';
import 'package:http/http.dart' as http;

class DownloadFileUrl{
  static Future<void> downloadFile(String outputDir, String fileName, String fileUrl)async{

    final pdfResponse = await http.get(Uri.parse(fileUrl));
     final outputPath = '$outputDir/$fileName';

    final file = File(outputPath);
    await file.writeAsBytes(pdfResponse.bodyBytes);

    print('File saved at: $outputPath');
  }
}