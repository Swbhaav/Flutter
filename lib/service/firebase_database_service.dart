import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form/Model/user_model.dart';

class FirebaseDatabaseService {
  final dbInstance = FirebaseFirestore.instance;
  final usersList = [];

// this function is used to get a single user details from firebase
  Future getSingleUser() async {
    try {
      CollectionReference usersCollection = dbInstance.collection('users');
      final userDoc = await usersCollection.doc('user1').get();
      if (userDoc.exists) {
        print('The use1 details is ${userDoc.data()}');
      } else {
        print('Data not found');
      }
    } catch (e) {
      print('Error fetching data $e');
    }
  }

  // This function is used to ge list of user from a collection in firebase
  Future getUsersInACollection() async {
    try {
      CollectionReference _usersCollection =
          await dbInstance.collection('users');
      await _usersCollection.get().then((querySnapShot) {
        for (var doc in querySnapShot.docs) {
          usersList.add(doc.data());
        }
      });
      print('Users list ${usersList.length}');
      return usersList;
    } catch (e) {
      print('Error while getting users $e');
    }
  }

  //create a user in firestore database
  void createUser({required UserModel userModel}) async {
    try {
      CollectionReference _usersCollection =
          await dbInstance.collection('users');
      await _usersCollection.add(userModel.toJson()).whenComplete(() {
        print('User created Success');
      });
    } catch (e) {
      print('Something went wrong $e');
    }
  }

  ///This function is used to get user details using uid
  Future<UserModel?> getUserDetailsUsingUID({required String uId}) async {
    try {
      CollectionReference _userCollection =
          await dbInstance.collection('users');
      final snapShot = await _userCollection.where('id', isEqualTo: uId).get();
      final userModel = snapShot.docs
          .map((doc) => UserModel.fromJson(
              doc as QueryDocumentSnapshot<Map<String, dynamic>>))
          .single;
      return userModel;
    } catch (e) {
      print('Something went wrong $e');
    }
    return null;
  }

  //Get All users in a database
  Future<List<UserModel>> getAllUsersInADatabase() async {
    try {
      CollectionReference _userCollection =
          await dbInstance.collection('users');
      final snapshot = await _userCollection.get();
      return await snapshot.docs
          .map((doc) => UserModel.fromJson(
              doc as QueryDocumentSnapshot<Map<String, dynamic>>))
          .toList();
    } catch (e) {
      print('Something went wrong');
    }
    return [];
  }
}
