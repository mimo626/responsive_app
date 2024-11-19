import 'package:flutter/material.dart';
import 'package:responsive_app/mobile_page.dart';
import 'package:responsive_app/product_grid_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: MobilePage(),
    );
  }
}