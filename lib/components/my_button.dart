import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  MyButton({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 50,
        child: FlatButton(
          onPressed: onPressed,
          child: child,
          color: Colors.grey,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
