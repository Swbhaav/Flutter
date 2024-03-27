import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form/controller/login_controller.dart';
import 'package:form/service/firebase_auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    loginController.checkIfUserIsLoggedIn(context);
    print('Build Called');
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: loginController.usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: loginController.passwordController,
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
                  child: Obx(() {
                    return Checkbox(
                      value: loginController.isChecked.value,
                      onChanged: (newValue) {
                        print('New Value $newValue');
                        if (newValue != null) {
                          loginController.isChecked.value = newValue;
                        }
                      },
                    );
                  }),
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
                    onPressed: () => loginController.handleLogin(context),
                    child: Text('Login'),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.03,
                ),
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Reset'),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.03,
                ),
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/Register'),
                    child: Text('Signup'),
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
