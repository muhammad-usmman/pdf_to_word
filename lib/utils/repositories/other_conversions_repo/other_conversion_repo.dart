import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OtherConversionRepo {
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
        return {'error': 'Conversion failed: ${response.reasonPhrase} (${response.statusCode})'};
      }
    } catch (e) {
      return {'error': 'An unexpected error occurred: $e'};
    }
  }

  Future<Map<String, String>> convertPngToJpg(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/png/to/jpg', filePath);
  }

  Future<Map<String, String>> convertGifToPng(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/gif/to/png', filePath);
  }

  Future<Map<String, String>> convertGifToJpg(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/gif/to/jpg', filePath);
  }

  Future<Map<String, String>> convertJpgToPng(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/jpg/to/png', filePath);
  }

  Future<Map<String, String>> convertAnyToZip(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/any/to/zip', filePath);
  }
}
