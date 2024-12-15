//Save secured pdf and launch it
import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  Directory? directory = await getDownloadsDirectory();
  if(directory != null) {
    String path = directory.path;
    File file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
     OpenFile.open('$path/$fileName');
  }
}