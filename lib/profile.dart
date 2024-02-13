
import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Profile'),
        centerTitle: true,
    ),
          body: Center(
        child: Text('This is Profile page'),
    ),
    );
  }
}
