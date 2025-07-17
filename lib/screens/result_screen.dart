import 'dart:io';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final File image;
  final List result;

  const ResultScreen({super.key, required this.image, required this.result});

  @override
  Widget build(BuildContext context) {
    final label = result[0]['label'];
    final confidence = (result[0]['confidence'] * 100).toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(title: const Text("Diagnosis Result")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.file(image, height: 250),
            const SizedBox(height: 20),
            Text("Prediction: $label", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text("Confidence: $confidence%", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
