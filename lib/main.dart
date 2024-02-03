
import 'package:flutter/material.dart';
import 'package:form/Login.dart';
import 'package:form/dashboard.dart';
import 'package:form/regestration_Form.dart';
import 'package:form/list_view_page.dart';
import 'package:form/splash.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    routes: {
      '/': (context) => splash(),
      '/register':(context)=>RegistrationForm(),
      '/login':(context)=>const Login(),
      '/dashboard':(context)=>const Dashboard(),
      '/list-view-page':(context)=> const ListViewPage(),

    },
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample App'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.connecting_airports_outlined),
        onPressed: () {},
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/login'),
                child: const Text('Login')),
            const SizedBox(width: 25,),
            ElevatedButton(onPressed: ()=> Navigator.of(context).pushNamed('/register'),
                child: const Text('Register')),
            const SizedBox(width: 25,),
            ElevatedButton(onPressed: ()=> Navigator.of(context).pushNamed('/dashboard'),
                child: const Text('Dashboard')),
            const SizedBox(width: 25,),
            ElevatedButton(onPressed: ()=> Navigator.of(context).pushNamed('/list-view-page'),
                child: const Text('List viewPage'))
          ],
        ),
      ),
    );
  }
}


