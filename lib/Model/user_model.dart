
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? id;
  String? fullName;
  int? phoneNumber;
  String? address;

  UserModel({this.id, this.fullName, this.phoneNumber, this.address});

//This function is used to convert flutter model object to firebase readable json
  toJson(){
    return{
      'id':id,
      'full_Name':fullName,
      'phone_Number':phoneNumber,
      'address':address,
    };
  }

  factory UserModel.fromJson(QueryDocumentSnapshot<Map<String,dynamic>>documentSnapshot){
    final data = documentSnapshot.data();
    return UserModel(
      fullName: data['full_name'],
      phoneNumber: data['phone_number'],
      address: data['address'],
    );

  }

}