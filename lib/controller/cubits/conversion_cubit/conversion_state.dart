part of 'conversion_cubit.dart';

@immutable
sealed class ConversionState {}

final class ConversionInitial extends ConversionState {}

final class ConversionLoading extends ConversionState {}

final class ConversionFileLoaded extends ConversionState {
  final String fileName;
  final String fileUrl;

  ConversionFileLoaded({required this.fileUrl, required this.fileName});
}

final class ConversionListLoaded extends ConversionState {
  final List<String> fileNames;
  final List<String> fileUrls;

  ConversionListLoaded({required this.fileUrls, required this.fileNames});
}

final class ConversionLoadedAndDownloaded extends ConversionState {
  final String message;

  ConversionLoadedAndDownloaded({required this.message});
}

final class ConversionError extends ConversionState {
  ConversionError(String error);
}
