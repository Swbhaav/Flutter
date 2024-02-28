import 'dart:js';

import 'package:form/list_view_page.dart';
import 'package:form/dashboard.dart';
import 'package:form/login.dart';
import 'package:form/offers.dart';
import 'package:form/Profile/profile.dart';
import 'package:form/splash.dart';
import 'package:form/utils/default_firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form/registrationForm.dart';

void main() {
  initializeFirebase();
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => splash(),
      '/Register': (context) => RegistrationForm(),
      '/Login': (context) => Login(),
      '/Dashboard': (context) => Dashboard(),
      '/List_view': (context) => ListView(),
      '/mainApp': (context) => MyApp(),
      '/Profile': (context) => Profile(),
    },

    debugShowCheckedModeBanner: false,
  ));
}

void initializeFirebase() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pages = [
    Dashboard(),
    ListViewPage(),
    offerPage(),
    Profile(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List View',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
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
          print('Selected Index $index');
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),

      body: pages.elementAt(_currentIndex),
    );
  }
}