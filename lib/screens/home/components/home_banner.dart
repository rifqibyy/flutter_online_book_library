import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
          image: AssetImage(
            'assets/images/book.jpg',
          ),
        ),
      ),
      height: 120,
      width: double.infinity,
      margin: EdgeInsets.all(14),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Discover New Thing!',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
