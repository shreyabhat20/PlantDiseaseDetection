import 'dart:io';
import 'package:tflite/tflite.dart';

class TFLiteService {
  static Future loadModel() async {
    await Tflite.loadModel(
      model: "assets/models/model.tflite",
      labels: "assets/models/labels.txt",
    );
  }

  static Future<List?> classifyImage(File image) async {
    return await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );
  }
}
