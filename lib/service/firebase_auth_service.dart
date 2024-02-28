
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  FirebaseAuth _auth= FirebaseAuth.instance;
  Future<User?>createUserWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }catch(e){
      print('Something went wrong');
    }
    return null;
  }

  Future<User?> loginWithEmailAndPassword(String email, String password)async{
    try{
      UserCredential userCredential= await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }on FirebaseAuthException catch(e){
      print('Firebase Login Error $e');
    }catch(e){
      print('something went wrong $e');
    }
    return null;
  }
  ///This function is used to logout user from firebase
  void signOutUser()async{
    try{
      _auth.signOut();
    }
    catch(e){
      print('Error while Signout $e');
    }
  }

  Future<User?>getLoggedInUser()async{
    //Create a completer to handel asynchronous operation
    Completer<User?> completer= Completer<User?>();
    _auth.authStateChanges().listen((User? user) {
      if(user != null){
        completer.complete(user);
    }else{
        print('User is signed out!');
        completer.complete(null);
    }
    });
    //return the future from the completer
    return completer.future;
  }

}