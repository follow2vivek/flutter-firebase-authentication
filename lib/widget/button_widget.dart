import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/res/style.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onClick;
  ButtonWidget({@required this.buttonText, @required this.onClick});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: FlatButton(
        onPressed: onClick,
        child: Text(
          buttonText,
          style: styleButtonText,
          textAlign: TextAlign.center,
        ),
        color: Theme.of(context).primaryColorDark,
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
