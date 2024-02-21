
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

}