import 'package:flutter/material.dart';
import 'package:form/Model/user_model.dart';
import 'package:form/service/firebase_database_service.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FutureBuilder(
            future: FirebaseDatabaseService().getAllUsersInADatabase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //if data is returned form firebase
                if (snapshot.hasData) {
                  final usersList = snapshot.data;
                  return ListView.builder(
                    itemCount: usersList != null ? usersList.length : 0,
                    itemBuilder: (context, index) {
                      if (usersList != null) {
                        final userModelDetails = usersList[index];
                        return BasicDetails(
                          userModel: userModelDetails,
                        );
                      }
                    },
                  );
                }
                //If error is returned form firebase
                if (snapshot.hasError) {
                  return Center(
                    child: Text('No users found'),
                  );
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

class BasicDetails extends StatelessWidget {
  BasicDetails({required this.userModel});
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(
              0,
              3,
            ), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userModel != null
              ? Text('Name:${userModel!.fullName}')
              : Text('Name:-'),
          SizedBox(
            height: 5,
          ),
          userModel != null
              ? Text('Phone:${userModel!.phoneNumber} ')
              : Text('Phone:-'),
          SizedBox(
            height: 5,
          ),
          userModel != null
              ? Text('Address:${userModel!.address} ')
              : Text('Address:-'),
        ],
      ),
    );
  }
}
