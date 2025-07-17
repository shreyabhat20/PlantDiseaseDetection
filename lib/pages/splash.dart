import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/result_screen.dart';
import '../services/ml_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  List? _output;

  Future pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _output = await TFLiteService.classifyImage(_image!);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(image: _image!, result: _output!),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    TFLiteService.loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kethi Raksha")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => pickImage(ImageSource.camera),
              icon: const Icon(Icons.camera_alt),
              label: const Text("Capture Image"),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => pickImage(ImageSource.gallery),
              icon: const Icon(Icons.image),
              label: const Text("Upload from Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
