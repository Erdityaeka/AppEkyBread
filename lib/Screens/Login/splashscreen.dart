import 'dart:async';
import 'package:ekybread/Screens/Login/login.dart';
import 'package:ekybread/widgets/theme.dart';
import 'package:flutter/material.dart';

class Splasscreen extends StatefulWidget {
  const Splasscreen({super.key});

  @override
  State<Splasscreen> createState() => _SplasscreenState();
}

class _SplasscreenState extends State<Splasscreen> {
  void initState() {
    super.initState();
    // Delay 3 detik lalu pindah ke HomePage
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: browncolor, // Warna latar belakang
      body: Center(
        child: Image.asset("assets/login/logo.png", width: 200), // Logo Splash
      ),
    );
  }
}
