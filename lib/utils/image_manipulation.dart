// import 'dart:typed_data';
// import 'package:image/image.dart' as img;
//
// /// Function to rotate an image to landscape or portrait
// Future<Uint8List> changeOrientation(Uint8List imageData, bool isLandscape) async {
//   // Decode the image from bytes
//   final originalImage = img.decodeImage(imageData)!;
//
//   // Rotate the image
//   final rotatedImage = isLandscape
//       ? img.copyRotate(originalImage, 90) // Rotate to landscape
//       : originalImage; // Keep original orientation for portrait
//
//   // Encode back to bytes
//   return Uint8List.fromList(img.encodeJpg(rotatedImage));
// }
//
// /// Function to add a margin around an image
// Future<Uint8List> applyMargin(Uint8List imageData, int marginSize) async {
//   // Decode the image from bytes
//   final originalImage = img.decodeImage(imageData)!;
//
//   // Create a new canvas image with larger dimensions for the margins
//   final newWidth = originalImage.width + marginSize * 2;
//   final newHeight = originalImage.height + marginSize * 2;
//
//   // Create a blank canvas with a white background
//   final canvas = img.Image(newWidth, newHeight)
//     ..fill(img.getColor(255, 255, 255)); // White background
//
//   // Draw the original image onto the canvas
//   img.copyInto(canvas, originalImage, dstX: marginSize, dstY: marginSize);
//
//   // Encode the final image back to bytes
//   return Uint8List.fromList(img.encodeJpg(canvas));
// }
