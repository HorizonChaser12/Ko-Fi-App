import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ko-Fi"),
          actions: const [],
        ),
        body: Container(
          child: Lottie.asset("assets/Coffee1.json"),
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
