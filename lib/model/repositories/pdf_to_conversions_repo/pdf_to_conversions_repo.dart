import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PdfToConversionsRepo{
  final apiKey = dotenv.env['CONVERTAPI_SECRET'];

   Future<Map<String, String>> _convert(String endpoint, String filePath) async {
    final url = Uri.parse(endpoint);

    try {
      if (apiKey == null || apiKey == '') {
        return {'error': 'API Key is missing or invalid.'};
      }

      var headers = {
        'Authorization': 'Bearer $apiKey',
      };

      var request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath('file', filePath));
      request.headers.addAll(headers);
      request.fields.addAll({'Timeout': '900', 'StoreFile': 'true'});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final data = jsonDecode(responseData.body);

        if (data['Files'] != null && data['Files'] is List && data['Files'].isNotEmpty) {
          final fileUrl = data['Files'][0]['Url'];
          final fileName = data['Files'][0]['FileName'];

          return {'fileUrl': fileUrl, 'fileName': fileName};
        } else {
          return {'error': 'Files field is missing or empty in response.'};
        }
      } else {
        return {
          'error': 'Conversion failed: ${response.reasonPhrase} (${response.statusCode})'
        };
      }
    } catch (e) {
      return {'error': 'An unexpected error occurred: $e'};
    }
  }

   Future<Map<String, String>> convertPdfToDocx(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/pdf/to/docx', filePath);
  }

   Future<Map<String, String>> convertPdfToJpg(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/pdf/to/jpg', filePath);
  }

   Future<Map<String, String>> convertPdfToText(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/pdf/to/txt', filePath);
  }

   Future<Map<String, String>> convertPdfToHtml(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/pdf/to/html', filePath);
  }


}
