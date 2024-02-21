
import 'package:flutter/material.dart';
import 'package:form/service/firebase_auth_service.dart';



class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext dashboardContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          GestureDetector(
            child: Icon(Icons.logout),
            onTap: () async{
              await showDialog(
                  context: dashboardContext,
                  builder: (BuildContext dialogContext){
                    return AlertDialog(
                      title: Text('Signout Dialog'),
                      icon: Icon(Icons.warning),
                      content: Text('Are your sure you want to signout?'),
                      actions: [
                        GestureDetector(
                          child: Text('Yes'),
                          onTap: (){
                            final firebaseAuthService = FirebaseAuthService();
                            firebaseAuthService.signOutUser();
                            Navigator.of(dialogContext).pop();
                            Navigator.of(dashboardContext).pushReplacementNamed('/Login');
                          },
                        ),
                        GestureDetector(
                          child: Text('No'),
                          onTap: (){
                            Navigator.of(dialogContext).pop();
                          },),
                      ],
                    );
                  }
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(' This is the Dashboard'),
      ),
    );
  }
}
