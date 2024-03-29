import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Start with the Splash Screen
      debugShowCheckedModeBanner: false, // Remove the "DEBUG" banner
    );
  }
}
