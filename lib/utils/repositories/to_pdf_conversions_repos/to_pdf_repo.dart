import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ToPdfConversionRepo {
  final apiKey = dotenv.env['CONVERTAPI_SECRET']; // Access the key

  Future<void> convertDocxToPdf(String filePath, String outputDir) async {
    final url = Uri.parse('https://v2.convertapi.com/convert/docx/to/pdf');

    try {
      if (apiKey == null || apiKey == '') {
        throw Exception('API Key is missing or invalid.');
      }

      print('Using API Key: $apiKey');

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
        print('Raw Response: ${responseData.body}'); // Debugging line

        // Parse response JSON
        final data = jsonDecode(responseData.body);
        print('Parsed Response: $data'); // Debugging line

        // Access file URL
        if (data['Files'] != null && data['Files'] is List && data['Files'].isNotEmpty) {
          final fileUrl = data['Files'][0]['Url'];
          print('Converted file URL: $fileUrl');

          // Download and save the file
          final pdfResponse = await http.get(Uri.parse(fileUrl));
          final fileName = data['Files'][0]['FileName'];
          final outputPath = '$outputDir/$fileName';

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
      print('Error: $e');
    }
  }
  Future<void> convertPptToPdf(String filePath, String outputDir) async {
    final url = Uri.parse('https://v2.convertapi.com/convert/pptx/to/pdf');

    try {
      if (apiKey == null || apiKey == '') {
        throw Exception('API Key is missing or invalid.');
      }

      print('Using API Key: $apiKey');

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
        print('Raw Response: ${responseData.body}'); // Debugging line

        // Parse response JSON
        final data = jsonDecode(responseData.body);
        print('Parsed Response: $data'); // Debugging line

        // Access file URL
        if (data['Files'] != null && data['Files'] is List && data['Files'].isNotEmpty) {
          final fileUrl = data['Files'][0]['Url'];
          print('Converted file URL: $fileUrl');

          // Download and save the file
          final pdfResponse = await http.get(Uri.parse(fileUrl));
          final fileName = data['Files'][0]['FileName'];
          final outputPath = '$outputDir/$fileName';

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
      print('Error: $e');
    }
  }
  Future<void> convertBmpToPdf(String filePath, String outputDir) async {
    final url = Uri.parse('https://v2.convertapi.com/convert/bmp/to/pdf');

    try {
      if (apiKey == null || apiKey == '') {
        throw Exception('API Key is missing or invalid.');
      }

      print('Using API Key: $apiKey');

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
        print('Raw Response: ${responseData.body}'); // Debugging line

        // Parse response JSON
        final data = jsonDecode(responseData.body);
        print('Parsed Response: $data'); // Debugging line

        // Access file URL
        if (data['Files'] != null && data['Files'] is List && data['Files'].isNotEmpty) {
          final fileUrl = data['Files'][0]['Url'];
          print('Converted file URL: $fileUrl');

          // Download and save the file
          final pdfResponse = await http.get(Uri.parse(fileUrl));
          final fileName = data['Files'][0]['FileName'];
          final outputPath = '$outputDir/$fileName';

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
      print('Error: $e');
    }
  }
  Future<void> convertXlsToPdf(String filePath, String outputDir) async {
    final url = Uri.parse('https://v2.convertapi.com/convert/Xlsx/to/pdf');

    try {
      if (apiKey == null || apiKey == '') {
        throw Exception('API Key is missing or invalid.');
      }

      print('Using API Key: $apiKey');

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
        print('Raw Response: ${responseData.body}'); // Debugging line

        // Parse response JSON
        final data = jsonDecode(responseData.body);
        print('Parsed Response: $data'); // Debugging line

        // Access file URL
        if (data['Files'] != null && data['Files'] is List && data['Files'].isNotEmpty) {
          final fileUrl = data['Files'][0]['Url'];
          print('Converted file URL: $fileUrl');

          // Download and save the file
          final pdfResponse = await http.get(Uri.parse(fileUrl));
          final fileName = data['Files'][0]['FileName'];
          final outputPath = '$outputDir/$fileName';

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
      print('Error: $e');
    }
  }

// #todo: didnt work in postman need to look more into it
  // Future<void> convertImageToPdf(String filePath, String outputDir, String apiKey) async {
  //   final url = Uri.parse('https://v2.convertapi.com/convert/image/to/pdf');
  //
  //   try {
  //     final headers = {'Authorization': 'Bearer $apiKey'};
  //     var request = http.MultipartRequest('POST', url)
  //       ..headers.addAll(headers)
  //       ..files.add(await http.MultipartFile.fromPath('file', filePath));
  //
  //     final response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       final responseData = await http.Response.fromStream(response);
  //       final data = jsonDecode(responseData.body);
  //
  //       // Get the converted PDF file URL
  //       final fileUrl = data['Files'][0]['Url'];
  //       print('Converted PDF URL: $fileUrl');
  //
  //       // Download and save the PDF
  //       final pdfResponse = await http.get(Uri.parse(fileUrl));
  //       final fileName = data['Files'][0]['FileName'];
  //       final outputPath = '$outputDir/$fileName';
  //
  //       final file = File(outputPath);
  //       await file.writeAsBytes(pdfResponse.bodyBytes);
  //
  //       print('File saved at: $outputPath');
  //     } else {
  //       print('Conversion failed: ${response.reasonPhrase} ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
}