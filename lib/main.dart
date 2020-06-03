import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_auth/res/color.dart';
import 'package:flutter_firebase_auth/route/routes.dart';
import 'package:flutter_firebase_auth/screen/home_screen.dart';
import 'package:flutter_firebase_auth/screen/login_screen.dart';
import 'package:flutter_firebase_auth/service/firebase/firebase_auth_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: colorPrimaryDark,
      systemNavigationBarColor: colorPrimaryDark,
    ),
  );
  runApp(
    StreamProvider(
      create: (BuildContext context) => FirebaseAuthService.firebaseListner,
      child: MaterialApp(
        theme: ThemeData(
          primaryColorDark: colorPrimaryDark,
          accentColor: colorPrimaryDark,
          primaryColor: colorPrimary,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoute,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<FirebaseUser>(context) == null
        ? LoginScreen()
        : HomeScreen();
  }
}
