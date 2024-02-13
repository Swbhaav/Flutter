
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  FirebaseAuth _auth= FirebaseAuth.instance;
  Future<User?>creatUserWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }catch(e){
      print('Went something wrong');
    }
  }


}