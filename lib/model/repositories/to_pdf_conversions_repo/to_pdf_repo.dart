import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ToPdfConversionRepo {
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

  Future<Map<String, String>> convertDocxToPdf(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/docx/to/pdf', filePath);
  }

  Future<Map<String, String>> convertPptToPdf(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/pptx/to/pdf', filePath);
  }

  Future<Map<String, String>> convertBmpToPdf(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/bmp/to/pdf', filePath);
  }

  Future<Map<String, String>> convertXlsToPdf(String filePath) async {
    return await _convert('https://v2.convertapi.com/convert/xlsx/to/pdf', filePath);
  }

// Generic Image to PDF Conversion
// this is for all images u can find supported types in UI code
//   Future<Map<String, String>> convertImageToPdf(String filePath) async {
//     try {
//       if (apiKey == null || apiKey == '') {
//         return {'error': 'API Key is missing or invalid.'};
//       }
//
//       var headers = {
//         'Authorization': 'Bearer $apiKey',
//       };
//
//       var request = http.MultipartRequest(
//           'POST', Uri.parse('https://v2.convertapi.com/convert/images/to/pdf'));
//       request.files.add(await http.MultipartFile.fromPath('Files', filePath));
//       request.headers.addAll(headers);
//       request.fields.addAll({'Timeout': '900', 'StoreFile': 'true'});
//
//       http.StreamedResponse response = await request.send();
//
//       if (response.statusCode == 200) {
//         final responseData = await http.Response.fromStream(response);
//         final data = jsonDecode(responseData.body);
//
//         if (data['Files'] != null && data['Files'] is List && data['Files'].isNotEmpty) {
//           final fileUrl = data['Files'][0]['Url'];
//           final fileName = data['Files'][0]['FileName'];
//
//           return {'fileUrl': fileUrl, 'fileName': fileName};
//         } else {
//           return {'error': 'Files field is missing or empty in response.'};
//         }
//       } else {
//         log("'error': 'Conversion failed: ${response.reasonPhrase} (${response.statusCode})'");
//
//         return {'error': 'Conversion failed: ${response.reasonPhrase} (${response.statusCode})'};
//       }
//     } catch (e) {
//       return {'error': 'An unexpected error occurred: $e'};
//     }
//   }

  Future<Map<String, String>> convertImageToPdf(List<String> filePath, String marginVertical,
      String marginHorizontal, String pageSize, String pageOrientation) async {
    try {
      if (apiKey == null || apiKey == '') {
        return {'error': 'API Key is missing or invalid.'};
      }

      var headers = {
        'Authorization': 'Bearer $apiKey',
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('https://v2.convertapi.com/convert/images/to/pdf'));

      for (int i = 0; i < filePath.length; i++) {
        request.files.add(await http.MultipartFile.fromPath('Files[$i]', filePath[i]));
      }

      // for(String path in filePath){
      //   request.files.add(await http.MultipartFile.fromPath('Files', path));
      //
      // }
      //
      // request.files.add(await http.MultipartFile.fromPath('Files', filePath));
      request.headers.addAll(headers);

      request.fields.addAll({
        'Timeout': '900',
        'StoreFile': 'true',
        'MarginHorizontal': marginHorizontal,
        'MarginVertical':marginVertical,
        'PageSize': pageSize,
        'PageOrientation': pageOrientation
      });

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
        log("'error': 'Conversion failed: ${response.reasonPhrase} (${response.statusCode})'");

        return {'error': 'Conversion failed: ${response.reasonPhrase} (${response.statusCode})'};
      }
    } catch (e) {
      return {'error': 'An unexpected error occurred: $e'};
    }
  }
}
