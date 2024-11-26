import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;



class ToPdfConversionRepo {

  final apiKey = dotenv.env['CONVERTAPI_SECRET']; // Access the key


    Future<void> convertDocxToPdf(String filePath, String outputDir) async {
       final url = Uri.parse('https://v2.convertapi.com/convert/docx/to/pdf');

      try {
        print(apiKey!);
        // Create a multipart request
        var headers = {
          'Authorization':'Bearer $apiKey'
        };
        var request = http.MultipartRequest('POST', url);
        request.files.add(await http.MultipartFile.fromPath('file', filePath));
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          final responseData = await http.Response.fromStream(response);
          final data = jsonDecode(responseData.body);

          // Get the URL of the converted PDF file
          final fileUrl = data['Files'][0]['FileData'];
          print('Converted file URL: $fileUrl');

          // Download the PDF file and save it to the output directory
          final pdfResponse = await http.get(Uri.parse(fileUrl));
          final fileName = data['Files'][0]['FileName'];
          final outputPath = '$outputDir/$fileName';

          final file = File(outputPath);
          await file.writeAsBytes(pdfResponse.bodyBytes);

          print('File saved at: $outputPath');
        } else {
          print('Conversion failed: ${response.reasonPhrase} ${response.statusCode}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }

 }
