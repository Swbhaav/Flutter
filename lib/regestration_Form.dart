import 'package:flutter/material.dart';
import 'package:form/service/firebase_auth_service.dart';

class RegistrationForm extends StatelessWidget {
   RegistrationForm({super.key});
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _emailRegexPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  keyboardType: TextInputType.name,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter your name",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Full Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailAddressController,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 90,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter your Email",
                  ),
                  validator: (emailValue) {
                    if (emailValue == null || emailValue.trim().isEmpty) {
                      return 'Please Enter Your Email';
                    }
                    final regex = RegExp(_emailRegexPattern);
                    if (!regex.hasMatch(emailValue)) {
                      return 'Please Enter a valid Email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 20,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Your Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _streetAddressController,
                  keyboardType: TextInputType.streetAddress,
                  maxLength: 30,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter address",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ListTile(
                    title: const Text('this is listTile'),
                    subtitle: const Text('This is subtitle'),
                    leading: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa14vJmR5wBRZZEydhuuDSIceDoCd8fMrkXw&usqp=CAU')
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null) {
                      if (_formKey.currentState!.validate()) {
                        final email = _emailAddressController.text;
                        final password = _passwordController.text;

                        final firebaseAuthService = FirebaseAuthService();
                        firebaseAuthService.createUserWithEmailAndPassword(email, password);
                      }
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
