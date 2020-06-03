import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/res/color.dart';
import 'package:flutter_firebase_auth/res/style.dart';
import 'package:flutter_firebase_auth/service/firebase/firebase_auth_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lock_open),
            onPressed: () => FirebaseAuthService.firebaseLogout(),
            tooltip: 'Logout',
          )
        ],
        title: Text(
          'Welcome',
          style: styleToolbar,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
            future: FirebaseAuthService.firebaseUserDetail(),
            builder: (BuildContext context,
                AsyncSnapshot<FirebaseUser> firebaseSnapshot) {
              if (firebaseSnapshot.hasData) {
                return Text(
                  'Welcome ${firebaseSnapshot.data.email}',
                  style: styleButtonText.copyWith(color: colorBlack),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
