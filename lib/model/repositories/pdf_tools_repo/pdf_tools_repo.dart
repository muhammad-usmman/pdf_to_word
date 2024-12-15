import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PdfToolsRepo {
  final apiKey = dotenv.env['CONVERTAPI_SECRET'];

  Future<Map<String, String>> deletePdfsPages(String filePath, String pageRange) async {
    try {
      if (apiKey == null || apiKey == '') {
        return {'error': 'API Key is missing or invalid.'};
      }

      var headers = {
        'Authorization': 'Bearer $apiKey',
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('https://v2.convertapi.com/convert/pdf/to/delete-pages'));
      request.fields.addAll({'PageRange': pageRange, 'Timeout': '900', 'StoreFile': 'True'});
      request.files.add(await http.MultipartFile.fromPath('File', filePath));
      request.headers.addAll(headers);

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

  Future<List<Map<String, String>>> splitPdfs(String filePath, String splitPattern) async {
    try {
      if (apiKey == null || apiKey == '') {
        return [
          {'error': 'API Key is missing or invalid.'}
        ];
      }

      var headers = {
        'Authorization': 'Bearer $apiKey',
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('https://v2.convertapi.com/convert/pdf/to/split'));

      request.files.add(await http.MultipartFile.fromPath('File', filePath));
      request.headers.addAll(headers);

      request.fields.addAll({
        'Timeout': '900',
        'StoreFile': 'true',
        'SplitByPattern': splitPattern,
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final data = jsonDecode(responseData.body);

        if (data['Files'] != null && data['Files'] is List) {
          List<Map<String, String>> files = [];
          for (var file in data['Files']) {
            if (file['Url'] != null && file['FileName'] != null) {
              files.add({
                'fileUrl': file['Url'],
                'fileName': file['FileName'],
              });
            }
          }

          if (files.isNotEmpty) {
            return files;
          } else {
            return [
              {'error': 'No files found in the response.'}
            ];
          }
        } else {
          return [
            {'error': 'Files field is missing or empty in the response.'}
          ];
        }
      } else {
        log("Conversion failed: ${response.reasonPhrase} (${response.statusCode})");
        return [
          {'error': 'Conversion failed: ${response.reasonPhrase} (${response.statusCode})'}
        ];
      }
    } catch (e) {
      log('An unexpected error occurred: $e');
      return [
        {'error': 'An unexpected error occurred: $e'}
      ];
    }
  }

  Future<Map<String, String>> mergePdfs(List<String> filePath) async {
    try {
      if (apiKey == null || apiKey == '') {
        return {'error': 'API Key is missing or invalid.'};
      }

      var headers = {
        'Authorization': 'Bearer $apiKey',
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('https://v2.convertapi.com/convert/pdf/to/merge'));

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
        'RetainNumbering': 'false',
        'RemoveDuplicateFonts': 'false',
        'BookmarksToc': 'disabled',
        'OpenPage': '1',
        'PageSize': 'default',
        'PageOrientation': 'default'
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
