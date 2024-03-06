import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form/service/firebase_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
   const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isChecked = false;
  @override
  void initState() {
    checkIfUserIsLoggedIn();
    super.initState();
  }
  void checkIfUserIsLoggedIn()async {

    final user = await FirebaseAuthService().getLoggedInUser();
    if(user!=null){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uId', user.uid);
      Navigator.of(context).pushNamed('/mainApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: 'Enter your username'
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [

                FractionallySizedBox(
                  widthFactor: 0.2,
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (newValue){
                      print('New Value $newValue');
                      if(newValue!=null){
                        setState(() {
                          _isChecked = newValue;
                        });

                      }

                    },
                  ),
                ),

                FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Text('Agree to all conditions of the app?')),
              ],
            ),
            Wrap(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: ElevatedButton(
                    onPressed: () async{
                      if(_isChecked!=null){
                        if(_isChecked){
                          final username = _usernameController.text;
                          final password = _passwordController.text;
                          final firebaseAuthService = FirebaseAuthService();
                          final User? user = await firebaseAuthService.loginWithEmailAndPassword(username, password);
                          if(user != null){
                            print('login successful');
                            final SharedPreferences prefs= await SharedPreferences.getInstance();
                            await prefs.setString('uId', user.uid);
                            Navigator.of(context).pushReplacementNamed('/mainApp');
                          }else{
                            print('login error');
                          }
//proceed
                        }else{
                          print('Please check the terms');
                        }
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.03,
                ),
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: ElevatedButton(
                    onPressed: (){},
                    child:Text('Reset'),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.03,
                ),
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: ElevatedButton(
                    onPressed: ()=> Navigator.of(context).pushNamed('/Register'),
                    child:Text('Signup'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}