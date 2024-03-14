import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: FirebaseDatabaseService().getAllUsersInADatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              ///If data is returned from firebase
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
                    return Center(
                      child: Text('No users found'),
                    );
                  },
                );
              }

              ///If error is returned from firebase
              if (snapshot.hasError) {
                return Center(
                  child: Text('No users found'),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

///This is the widget for displaying the basic details of the user
class BasicDetails extends StatelessWidget {
  BasicDetails({required this.userModel});

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
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
                    ? Text('Name: ${userModel!.fullName}')
                    : Text('Name: -'),
                SizedBox(
                  height: 5,
                ),
                Text('Email: '),
                SizedBox(
                  height: 5,
                ),
                userModel != null
                    ? Text('Phone: ${userModel!.phoneNumber} ')
                    : Text('Phone: -'),
                SizedBox(
                  height: 5,
                ),
                userModel != null
                    ? Text('Address: ${userModel!.address} ')
                    : Text('Address: -'),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      icon: Icon(Icons.warning),
                      title: Text('Delete User'),
                      content: Text('Are you sure you want to delete?'),
                      actions: [
                        TextButton(
                          onPressed: () async{
                            final firebaseDatabaseService = FirebaseDatabaseService();
                            if(userModel != null){
                              if(userModel!.id !=null){
                                await firebaseDatabaseService.deleteUserUsingUID(uID: userModel!. id!);
                              }
                            }
                            Navigator.of(dialogContext).pop();
                          },
                          child: Text('Yes')
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () =>Navigator.of(dialogContext).pop(),
                          child: Text('No')
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
