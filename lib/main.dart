import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:coffee_shop_app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: const SplashPage(),
          ),
        ),
      ),
    );
  }
}
