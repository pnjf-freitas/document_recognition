import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OCRService with ChangeNotifier {
  String _recognizedText = 'No text recognized yet';
  String get recognizedText => _recognizedText;

  Future<void> processImage(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    _recognizedText = recognizedText.text;
    notifyListeners();
  }
}