
import 'package:flutter/material.dart';
import 'package:form/Model/user_model.dart';

class UpdateProfile extends StatelessWidget {
   UpdateProfile({super.key});

  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _emailRegexPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  /// Function to set Form Field controllers using user model data
void setUserModelDataToFormControllers(BuildContext context){
  final UserModel? usermodelDetails= ModalRoute.of(context)!.settings.arguments as UserModel;

  if(usermodelDetails!=null){
    if(usermodelDetails.fullName!=null)
      {
        _fullNameController.text= usermodelDetails.fullName!;
      }
    if(usermodelDetails.phoneNumber!=null)
    {
      _phoneNumberController.text= usermodelDetails.phoneNumber!.toString();
    }
    if(usermodelDetails.address!=null)
    {
      _streetAddressController.text= usermodelDetails.address!;
    }
  }
}

  @override
  Widget build(BuildContext context) {
  setUserModelDataToFormControllers(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              controller: _fullNameController,
              keyboardType: TextInputType.name,
              maxLength: 50,
              decoration: InputDecoration(
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
            SizedBox(height: 10),

            TextFormField(
              controller: _emailAddressController,
              keyboardType: TextInputType.emailAddress,
              maxLength: 90,
              decoration: InputDecoration(
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
            SizedBox(height: 10),
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your phone number',
              ),
              validator: (phoneNumberValue) {
                if (phoneNumberValue == null ||
                    phoneNumberValue.trim().isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _streetAddressController,
              keyboardType: TextInputType.streetAddress,
              maxLength: 30,
              maxLines: 4,
              decoration: InputDecoration(
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
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text('Update'),),

          ],
        ),
      ),
    );
  }
}
