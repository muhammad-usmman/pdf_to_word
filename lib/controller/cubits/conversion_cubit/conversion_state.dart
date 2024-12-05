part of 'conversion_cubit.dart';

@immutable
sealed class ConversionState {}

final class ConversionInitial extends ConversionState {}

final class ConversionLoading extends ConversionState {}

final class ConversionLoaded extends ConversionState {
  final String fileName;
  final String fileUrl;
  ConversionLoaded( {required this.fileUrl,required this.fileName});
}
final class ConversionListLoaded extends ConversionState {
  final List<String> fileNames;
  final List<String> fileUrls;
  ConversionListLoaded( {required this.fileUrls,required this.fileNames});
}

final class ConversionError extends ConversionState {

  ConversionError(String error);
}
