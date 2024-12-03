import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'file_picker_state.dart';

class FilePickerCubit extends Cubit<FilePickerState> {
  FilePickerCubit() : super(FilePickerInitial());

  Future<void> pickFile(List<String> fileTypeExtension) async {
    try {
      emit(FilePickerInitial());
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: fileTypeExtension,
        allowMultiple: false,
      );
      emit(FilePickerLoading());

      if (result != null && result.files.isNotEmpty) {
        final filePath = result.files.first.path;
        final fileName = result.files.first.name;
        if (filePath != null) {
          emit(FilePickerLoaded(fileName: [fileName], finalUrl: [filePath]));
        } else {
          emit(FilePickerError(error: 'Error Picking File'));
        }
      } else {
        emit(FilePickerError(error: 'No file selected'));
      }
    } catch (e) {
      emit(FilePickerError(error: 'Error while picking file: $e'));
    }
  }
  Future<void> pickMultipleFile(List<String> fileTypeExtension) async {
    try {
      emit(FilePickerInitial());
      final result = await FilePicker.platform.pickFiles(

        type: FileType.custom,
        allowedExtensions: fileTypeExtension,
        allowMultiple: true,
      );
      emit(FilePickerLoading());
      List<String> filePath=[];
      List<String> fileName=[];
      if (result != null && result.files.isNotEmpty) {
         for(PlatformFile file in result.files){
           filePath.add(file.path!);
           fileName.add(file.name);
         }
        if (filePath != null) {
          emit(FilePickerLoaded(fileName: fileName, finalUrl: filePath));
        } else {
          emit(FilePickerError(error: 'Error Picking File'));
        }
      } else {
        emit(FilePickerError(error: 'No file selected'));
      }
    } catch (e) {
      emit(FilePickerError(error: 'Error while picking file: $e'));
    }
  }
}
