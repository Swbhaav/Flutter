import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  final String a= "Hello";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _value =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Login'),
        centerTitle:true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          setState(() {
            _value+=1;
          });
        },
        child: const Icon(Icons.plus_one),
      ),
        body: Center(child: Text('${widget.a} the age is $_value'),),
    );
  }
}

