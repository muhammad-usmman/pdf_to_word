import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf_to_word/utils/save_and_launch.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as syncfusionPdf;
import 'package:syncfusion_flutter_pdf/pdf.dart';

class LockUnlockPdf {


 static Future<List<int>> _readDocumentData(String pdfPath) async {
   File file = File(pdfPath);
   List<int> pdfBytes = await file.readAsBytes();
   return pdfBytes;
   }

  static Future<void> securePdfWithPassword(String pdfPath, String fileName, String userPassword,
      String ownerPassword) async {
    syncfusionPdf.PdfDocument document = syncfusionPdf.PdfDocument(
      inputBytes: await _readDocumentData(pdfPath),
    );
    document.security.userPassword = userPassword;
    document.security.ownerPassword = ownerPassword;
    document.security.algorithm = syncfusionPdf.PdfEncryptionAlgorithm.aesx256Bit;
    document.security.permissions.addAll(
        [syncfusionPdf.PdfPermissionsFlags.print, syncfusionPdf.PdfPermissionsFlags.copyContent,]);
    List<int> securedBytes = await document.save();
    document.dispose();
    saveAndLaunchFile(securedBytes, 'secured_$fileName.pdf');
  }

  static Future<void> unlockPdfWithPassword(String pdfPath,String fileName, String ownerPassword, ) async {
    final document = syncfusionPdf.PdfDocument(
      inputBytes: await _readDocumentData(pdfPath),
      password: ownerPassword,
    );

    PdfSecurity security = document.security;
    security.userPassword = '';
    security.ownerPassword = '';
    security.permissions.clear();
    List<int> bytes = await document.save();
    document.dispose();
    saveAndLaunchFile(bytes, '${fileName}_unsecured.pdf');
  }
}