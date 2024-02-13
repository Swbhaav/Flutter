import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form/Login.dart';
import 'package:form/dashboard.dart';
import 'package:form/offers.dart';
import 'package:form/profile.dart';
import 'package:form/regestration_Form.dart';
import 'package:form/list_view_page.dart';
import 'package:form/splash.dart';
import 'package:form/utils/default_firebase_options.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    routes: {
      '/': (context) => splash(),
      '/register': (context) => RegistrationForm(),
      '/login': (context) => Login(),
      '/dashboard': (context) => Dashboard(),
      '/list-view-page': (context) => ListViewPage(),
      '/mainApp': (context) => MyApp(),
    },
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
  ));
}
void initializeFirebase()async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pages = [
    Dashboard(),
    ListViewPage(),
    offerPage(),
    profilePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dahsboard',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List-View',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          print('Selected index $index');
          setState(() {
            _currentIndex=index;
          });
        },
        currentIndex: _currentIndex,
      ),
      body: pages.elementAt(_currentIndex),
    );
  }
}
