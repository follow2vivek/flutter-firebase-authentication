import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/screen/home_screen.dart';
import 'package:flutter_firebase_auth/screen/login_screen.dart';
import 'package:flutter_firebase_auth/screen/registration_screen.dart';
import 'package:page_transition/page_transition.dart';

const routeLogin = '/login';
const routeRegister = '/Register';
const routeHome = '/home';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeLogin:
        return PageTransition(
            type: PageTransitionType.rightToLeft, child: LoginScreen());
        break;
      case routeRegister:
        //Map mapData = settings.arguments;
        return PageTransition(
            type: PageTransitionType.rightToLeft, child: RegistrationScreen());
        break;
      case routeHome:
        //Map mapData = settings.arguments;
        return PageTransition(
            type: PageTransitionType.rightToLeft, child: HomeScreen());
        break;
      default:
        return PageTransition(
            type: PageTransitionType.rightToLeft, child: LoginScreen());
        break;
    }
  }
}
