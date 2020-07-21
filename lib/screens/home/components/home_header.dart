import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String left;
  final String right;
  final Function fun;

  HomeHeader({this.left, this.right, this.fun});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (right != null)
            GestureDetector(
              child: Text(right),
              onTap: fun,
            ),
        ],
      ),
    );
  }
}
