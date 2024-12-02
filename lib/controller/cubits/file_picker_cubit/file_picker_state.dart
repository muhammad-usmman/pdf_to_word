part of 'file_picker_cubit.dart';

@immutable
sealed class FilePickerState {}

final class FilePickerInitial extends FilePickerState {}
final class FilePickerLoading extends FilePickerState {}
final class FilePickerLoaded extends FilePickerState {
  final String fileName;
  final String finalUrl;

  FilePickerLoaded({required this.fileName, required this.finalUrl});

}
final class FilePickerError extends FilePickerState {
  final String error;

  FilePickerError({required this.error});
}
