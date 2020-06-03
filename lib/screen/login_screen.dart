import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/res/style.dart';
import 'package:flutter_firebase_auth/route/routes.dart';
import 'package:flutter_firebase_auth/service/firebase/firebase_auth_service.dart';
import 'package:flutter_firebase_auth/widget/button_widget.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Login',
          style: styleToolbar,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: styleInputDecoration.copyWith(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                style: styleTextFieldText,
                onChanged: (value) => _email = value,
                validator: (value) => value.trim().isEmpty ? 'Enter email address' : null,
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
                validator: (value) => value.trim().isEmpty ? 'Enter password' : null,
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                buttonText: 'LOGIN',
                onClick: () {
                  print(_email);
                  if (_formKey.currentState.validate()) {
                    FirebaseAuthService.firebaseSignIn(_email, _password);
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have account?",
                    style: styleSmallText,
                    children: [
                      TextSpan(
                        text: ' Create New Account.',
                        style: styleSmallText.copyWith(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () => Navigator.pushNamed(context, routeRegister),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
