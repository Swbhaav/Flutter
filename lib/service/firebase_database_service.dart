
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseService{
  final dbInstance = FirebaseFirestore.instance;


  Future getSingleUser()async{
    try{
      CollectionReference userCollection = dbInstance.collection('users');
      final userDoc = await userCollection.doc('user1').get();
      if(userDoc.exists){
        print('The use1 details is ${userDoc.data()}');
      }else{
        print('Data not found');
      }
    }catch (e){

    }
  }
}