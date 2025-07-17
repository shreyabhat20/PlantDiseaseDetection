import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Kethi Raksha\n\n'
          'This app uses a CNN model to identify crop type'
          'Detects plant diseases from images captured by camera or uploaded.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
