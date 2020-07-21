import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:online_library/models/books.dart';

import 'package:online_library/utils/my_bottom_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Books>(
      create: (_) => Books(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Library',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.black87),
            ),
            textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
            scaffoldBackgroundColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            accentColor: Colors.black),
        home: MyBottomNavigation(),
      ),
    );
  }
}
