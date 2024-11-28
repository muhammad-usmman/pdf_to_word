import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'file_picker_state.dart';

class FilePickerCubit extends Cubit<FilePickerState> {
  FilePickerCubit() : super(FilePickerInitial());

  Future<void> pickFile(List<String> fileTypeExtension) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: fileTypeExtension,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final filePath = result.files.first.path;
        log('Selected file path: $filePath');
      } else {
        log('No file selected');
      }
    } catch (e) {
      log('Error while picking file: $e');
    }
  }
}

