import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ToPdfConversionRepo {
  final apiKey = dotenv.env['CONVERTAPI_SECRET'];

   Map<String, String> _validateAndGetHeaders() {
    if (apiKey == null || apiKey == '') {
      throw Exception('API Key is missing or invalid.');
    }
    return {'Authorization': 'Bearer $apiKey'};
  }

   Future<void> _handleConversion(
      Uri url,
      String filePath,
      String outputDir,
      ) async {
    var headers = _validateAndGetHeaders();

    var request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('file', filePath))
      ..headers.addAll(headers)
      ..fields.addAll({'Timeout': '900', 'StoreFile': 'true'});

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final data = jsonDecode(responseData.body);

        if (data['Files'] != null && data['Files'] is List && data['Files'].isNotEmpty) {
          final fileUrl = data['Files'][0]['Url'];
          final fileName = data['Files'][0]['FileName'];
          final outputPath = '$outputDir/$fileName';

          final pdfResponse = await http.get(Uri.parse(fileUrl));
          final file = File(outputPath);
          await file.writeAsBytes(pdfResponse.bodyBytes);

          print('File saved at: $outputPath');
        } else {
          print('Files field is missing or empty in response.');
        }
      } else {
        print('Conversion failed: ${response.reasonPhrase} (${response.statusCode})');
      }
    } catch (e) {
      print('Error during conversion: $e');
    }
  }

  Future<void> convertDocxToPdf(String filePath, String outputDir) async {
    final url = Uri.parse('https://v2.convertapi.com/convert/docx/to/pdf');
    await _handleConversion(url, filePath, outputDir);
  }

  Future<void> convertPptToPdf(String filePath, String outputDir) async {
    final url = Uri.parse('https://v2.convertapi.com/convert/pptx/to/pdf');
    await _handleConversion(url, filePath, outputDir);
  }

  Future<void> convertBmpToPdf(String filePath, String outputDir) async {
    final url = Uri.parse('https://v2.convertapi.com/convert/bmp/to/pdf');
    await _handleConversion(url, filePath, outputDir);
  }

  Future<void> convertXlsToPdf(String filePath, String outputDir) async {
    final url = Uri.parse('https://v2.convertapi.com/convert/xlsx/to/pdf');
    await _handleConversion(url, filePath, outputDir);
  }
}
