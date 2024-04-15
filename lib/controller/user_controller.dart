

import 'package:form/Model/user_model.dart';
import 'package:form/service/firebase_database_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController{
  var userModel = UserModel().obs;
  var uId = "".obs;
  final firebaseDatabaseService = FirebaseDatabaseService();

  @override
  void onReady(){
    initSharedPreferences();
    super.onReady();
  }

  void initSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    uId.value = prefs.getString('uId') ?? '';

    getUserDetailsFromFirebaseUsingUID();
  }

  ///Function to get userDetails using uID
  getUserDetailsFromFirebaseUsingUID() async{
    UserModel? userDetails;
    userDetails = await firebaseDatabaseService.getUserDetailsUsingUID(uId: uId.value);
    if(userDetails != null) {
      userModel.value = userDetails;
    }
    }
  }


