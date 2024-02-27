
import 'dart:async';

import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5),()=> Navigator.of(context).pushReplacementNamed('/Profile'));
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/infinity.gif'),
      ),
    );
  }
}
