import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pdf_to_word/model/repositories/other_conversions_repo/other_conversion_repo.dart';
import 'package:pdf_to_word/model/repositories/pdf_to_conversions_repo/pdf_to_conversions_repo.dart';
import 'package:pdf_to_word/model/repositories/pdf_tools_repo/pdf_tools_repo.dart';
import 'package:pdf_to_word/model/repositories/to_pdf_conversions_repo/to_pdf_repo.dart';
import 'package:pdf_to_word/utils/lock_unlock_pdfs/lock_pdf.dart';
 

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
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertBmpToPdf(String filePath) async {
    emit(ConversionLoading());

    final repo = ToPdfConversionRepo();
    final result = await repo.convertBmpToPdf(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertPptToPdf(String filePath) async {
    emit(ConversionLoading());

    final repo = ToPdfConversionRepo();
    final result = await repo.convertPptToPdf(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertXlsToPdf(String filePath) async {
    emit(ConversionLoading());

    final repo = ToPdfConversionRepo();
    final result = await repo.convertXlsToPdf(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  // this is for all images u can find supported types in UI code
  Future<void> convertImagesToPdf(List<String> filePath,String marginVertical,
      String marginHorizontal, String pageSize, String pageOrientation) async {
    emit(ConversionLoading());

    final repo = ToPdfConversionRepo();
    final result = await repo.convertImageToPdf(filePath,  marginVertical,
          marginHorizontal,   pageSize,  pageOrientation);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
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
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertPdfToJpg(String filePath) async {
    emit(ConversionLoading());

    final repo = PdfToConversionsRepo();
    final result = await repo.convertPdfToJpg(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertPdfToTxt(String filePath) async {
    emit(ConversionLoading());

    final repo = PdfToConversionsRepo();
    final result = await repo.convertPdfToText(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertPdfToHtml(String filePath) async {
    emit(ConversionLoading());

    final repo = PdfToConversionsRepo();
    final result = await repo.convertPdfToHtml(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  /// other conversions

// ml kit not supported on windows and mac use something else
  // Future<void> extractText(String imagePath, String savePath) async {
  //   emit(ConversionLoading());
  //   try {
  //   final inputImage = InputImage.fromFilePath(imagePath);
  //   final textRecognizer = TextRecognizer();
  //   final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
  //   print('Extracted Text: ${recognizedText.text}');
  //
  //
  //     // Get the directory for saving the file
  //     // final directory = await/ait getApplicationDocumentsDirectory();
  //
  //     // Construct the file path
  //     final filePath = '${savePath}/${recognizedText.text[5]}';
  //
  //     // Create the file and write the text
  //     final file = File(filePath);
  //     await file.writeAsString(recognizedText.text);
  //
  //     print('File saved at: $filePath');
  //   emit(ConversionLoaded(fileName: '', fileUrl: ''));
  //
  //   } catch (e) {
  //     
  //     emit(ConversionError(e.toString()));
  //   }
  //
  //
  // }

  Future<void> convertAnyToZip(String filePath) async {
    emit(ConversionLoading());

    final repo = OtherConversionRepo();
    final result = await repo.convertAnyToZip(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertGifToJpg(String filePath) async {
    emit(ConversionLoading());

    final repo = OtherConversionRepo();
    final result = await repo.convertGifToJpg(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertGifToPng(String filePath) async {
    emit(ConversionLoading());

    final repo = OtherConversionRepo();
    final result = await repo.convertGifToPng(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertJpgToPng(String filePath) async {
    emit(ConversionLoading());

    final repo = OtherConversionRepo();
    final result = await repo.convertJpgToPng(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> convertPngToJpg(String filePath) async {
    emit(ConversionLoading());

    final repo = OtherConversionRepo();
    final result = await repo.convertPngToJpg(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }
  Future<void> extractPdfImages(String filePath) async {
    emit(ConversionLoading());

    final repo = OtherConversionRepo();
     final result = await repo.extractPdfImages(filePath);

    if (result.isNotEmpty && result.first.containsKey('error')) {
      emit(ConversionError(result.first['error']!));
    } else {
      List<String> fileUrls = [];
      List<String> fileNames = [];

      for (var file in result) {
        fileUrls.add(file['fileUrl']!);
        fileNames.add(file['fileName']!);
      }
      log(fileUrls.toString());
      log(fileNames.toString());
      emit(ConversionListLoaded(fileUrls: fileUrls, fileNames: fileNames));
    }
  }


  // Pdf Tools
  Future<void> mergePDFs(List<String> filePath) async {
    emit(ConversionLoading());

    final repo = PdfToolsRepo();
    final result = await repo.mergePdfs(filePath);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> splitPdf(String filePath, String splitPattern) async {
    emit(ConversionLoading());

    final repo = PdfToolsRepo();
    log(splitPattern);
    final result = await repo.splitPdfs(filePath, splitPattern);

    if (result.isNotEmpty && result.first.containsKey('error')) {
      emit(ConversionError(result.first['error']!));
    } else {
      List<String> fileUrls = [];
      List<String> fileNames = [];

      for (var file in result) {
        fileUrls.add(file['fileUrl']!);
        fileNames.add(file['fileName']!);
      }
      log(fileUrls.toString());
      log(fileNames.toString());
      emit(ConversionListLoaded(fileUrls: fileUrls, fileNames: fileNames));
    }
  }

  Future<void> deletePdfPages(String filePath, String pagePattern) async {
    emit(ConversionLoading());

    final repo = PdfToolsRepo();
    final result = await repo.deletePdfsPages(filePath, pagePattern);

    if (result.containsKey('error')) {
      emit(ConversionError(result['error']!));
    } else {
      emit(ConversionFileLoaded(fileName: result['fileName']!, fileUrl: result['fileUrl']!));
    }
  }

  Future<void> lockPdf(
      String filePath, String fileName, String userPassword, String ownerPassword) async {
    emit(ConversionLoading());
    try {
      await LockUnlockPdf.securePdfWithPassword(filePath, fileName, userPassword, ownerPassword);
      emit(ConversionLoadedAndDownloaded(message: 'Locked File and Saved'));
    } catch (e) {
      

      emit(ConversionError(e.toString()));

     }
  }Future<void> unLockPdf(
      String filePath, String fileName,  String ownerPassword) async {
    emit(ConversionLoading());
    try {
      await LockUnlockPdf.unlockPdfWithPassword(filePath, fileName, ownerPassword,);
      emit(ConversionLoadedAndDownloaded(message: 'Un Locked File and Saved'));
    } catch (e) {
      
      emit(ConversionError(e.toString()));

     }
  }
}
