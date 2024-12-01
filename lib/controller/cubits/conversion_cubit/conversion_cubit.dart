import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
 import 'package:pdf_to_word/utils/repositories/pdf_to_conversions_repo/pdf_to_conversions_repo.dart';
import 'package:pdf_to_word/utils/repositories/to_pdf_conversions_repo/to_pdf_repo.dart';

part 'conversion_state.dart';

class ConversionCubit extends Cubit<ConversionState> {
  ConversionCubit() : super(ConversionInitial());
/// to pdf conversions
  Future<void> convertDocxToPdf(String filePath) async {
    emit(ConversionLoading());

    final repo = ToPdfConversionRepo();
    final result = await repo.convertDocxToPdf(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }
  Future<void> convertBmpToPdf(String filePath) async {
    emit(ConversionLoading());

    final repo = ToPdfConversionRepo();
    final result = await repo.convertBmpToPdf(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }
  Future<void> convertPptToPdf(String filePath) async {
    emit(ConversionLoading());

    final repo = ToPdfConversionRepo();
    final result = await repo.convertPptToPdf(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }
  Future<void> convertXlsToPdf(String filePath) async {
    emit(ConversionLoading());

    final repo = ToPdfConversionRepo();
    final result = await repo.convertXlsToPdf(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }
  ///from pdf to conversions
  Future<void> convertPdfToDocx(String filePath) async {
    emit(ConversionLoading());

    final repo = PdfToConversionsRepo();
    final result = await repo.convertPdfToDocx(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }
  Future<void> convertPdfToJpg(String filePath) async {
    emit(ConversionLoading());

    final repo = PdfToConversionsRepo();
    final result = await repo.convertPdfToJpg(filePath);


    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }
  Future<void> convertPdfToTxt(String filePath) async {
    emit(ConversionLoading());

    final repo = PdfToConversionsRepo();
    final result = await repo.convertPdfToText(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }
  Future<void> convertPdfToHtml(String filePath) async {
    emit(ConversionLoading());

    final repo = PdfToConversionsRepo();
    final result = await repo.convertPdfToHtml(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }
}
