import 'package:ekybread/Screens/Login/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod


void main() {
  runApp(
    // Bungkus aplikasi Anda dengan `ProviderScope`
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splasscreen(), // Halaman login
    );
  }
}
