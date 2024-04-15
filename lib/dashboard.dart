import 'dart:js';

import 'package:flutter/material.dart';
import 'package:form/controller/counter_controller.dart';
import 'package:form/controller/sample_list_controller.dart';
import 'package:form/service/firebase_auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext dashboardContext) {
    final CounterController counterController = Get.find();
    final SampleListController sampleListController =
        Get.put(SampleListController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () => sampleListController.insertDataIntoList('Hello'),
              icon: Icon(Icons.add)),
          SizedBox(width: 10),
          IconButton(
              onPressed: () => sampleListController.deleteDataFromList('Hello'),
              icon: Icon(Icons.remove)),
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
      body: Obx(() {
        return ListView.builder(
            itemCount: sampleListController.sampleList.length,
            itemBuilder: (context, index) {
              final sampleData = sampleListController.sampleList[index];
              return Container(
                color: Colors.grey.withOpacity(0.3),
                padding: EdgeInsets.all(10),
                child: Text('$sampleData'),
              );
            });
      }),
    );
  }
}
