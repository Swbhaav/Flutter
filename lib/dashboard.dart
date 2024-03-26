import 'package:flutter/material.dart';
import 'package:form/controller/counter_controller.dart';
import 'package:form/service/firebase_auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext dashboardContext) {
    final CounterController counterController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          GestureDetector(
            child: Icon(Icons.logout),
            onTap: () async {
              await showDialog(
                  context: dashboardContext,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: Text('Signout Dialog'),
                      icon: Icon(Icons.warning),
                      content: Text('Are your sure you want to signout?'),
                      actions: [
                        GestureDetector(
                          child: Text('Yes'),
                          onTap: () async {
                            final firebaseAuthService = FirebaseAuthService();
                            firebaseAuthService.signOutUser();
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove('uId');

                            Navigator.of(dialogContext).pop();
                            Navigator.of(dashboardContext)
                                .pushReplacementNamed('/Login');
                          },
                        ),
                        GestureDetector(
                          child: Text('No'),
                          onTap: () {
                            Navigator.of(dialogContext).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Obx(
                    () {
                return Text('The counter value is ${counterController.counter}');
              }
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                counterController.increment();
              },
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                counterController.decrement();
              },
            ),
          ],
        ),
      ),
    );
  }
}
