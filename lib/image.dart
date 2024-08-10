import 'package:flutter/material.dart';

// ignore: camel_case_types
class image extends StatefulWidget {
  const image({super.key});

  @override
  State<image> createState() => _imageState();
}

// ignore: camel_case_types
class _imageState extends State<image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.asset("assets/images/dart3.jfif")
        ],
      )),
    );
  }
}
