import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/res/style.dart';
import 'package:flutter_firebase_auth/service/firebase/firebase_auth_service.dart';
import 'package:flutter_firebase_auth/widget/button_widget.dart';

class RegistrationScreen extends StatelessWidget {
  String _email;
  String _password;
  String _confirmPassword;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Registration',
          style: styleToolbar,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
            ),
            SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        styleInputDecoration.copyWith(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    style: styleTextFieldText,
                    onChanged: (value) => _email = value,
                    validator: (value) =>
                        value.trim().isEmpty ? 'Enter email' : null,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: styleInputDecoration.copyWith(
                      labelText: 'Password',
                    ),
                    style: styleTextFieldText,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    maxLines: 1,
                    onChanged: (value) => _password = value,
                    validator: (value) =>
                        value.trim().isEmpty ? 'Enter password' : null,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: styleInputDecoration.copyWith(
                      labelText: 'Confirm Password',
                    ),
                    style: styleTextFieldText,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    maxLines: 1,
                    onChanged: (value) => _confirmPassword = value,
                    validator: (value) =>
                        value.trim().isEmpty || value.trim() != _password.trim()
                            ? 'Password mismatch'
                            : null,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
              buttonText: 'REGISTER',
              onClick: () {
                if (_formKey.currentState.validate()) {
                  FirebaseAuthService.firebaseRegistration(_email, _password);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
