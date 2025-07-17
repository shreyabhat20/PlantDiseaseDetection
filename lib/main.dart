import 'package:flutter/material.dart';
import 'pages/splash.dart';
import 'pages/home.dart';
import 'pages/camera.dart';
import 'pages/result.dart';

void main() {
  runApp(const KethiRakshaApp());
}

class KethiRakshaApp extends StatelessWidget {
  const KethiRakshaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kethi Raksha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/camera': (context) => const CameraScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}
