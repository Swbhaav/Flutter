
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseService{
  final dbInstance = FirebaseFirestore.instance;
  final usersList= [];

// this function is used to get a single user details from firebase
  Future getSingleUser()async{
    try{
      CollectionReference usersCollection = dbInstance.collection('users');
      final userDoc = await usersCollection.doc('user1').get();
      if(userDoc.exists){
        print('The use1 details is ${userDoc.data()}');
      }else{
        print('Data not found');
      }
    }catch (e){
      print('Error fetching data $e');

    }
  }
  // This function is used to ge list of user from a collection in firebase
  Future getUsersInACollection() async{
    try{
      CollectionReference _usersCollection = await dbInstance.collection('users');
      await _usersCollection.get().then((querySnapShot){
        for (var doc in querySnapShot.docs){
          usersList.add(doc.data());
        }
      });
      print('Users list ${usersList.length}');
      return usersList;

    }catch(e){
      print('Error while getting users $e');
    }
  }
}

