import 'package:flutter/material.dart';

import 'package:online_library/screens/discover/discover_screen.dart';
import 'package:online_library/screens/favorite/favorite_screen.dart';
import 'package:online_library/screens/home/home_screen.dart';
import 'package:online_library/screens/profile/profile_screen.dart';

class MyBottomNavigation extends StatefulWidget {
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _count = 0;

  List<Widget> _screens = [
    HomeScreen(),
    DiscoverScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      title: Text('Discover'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text('Favorite'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_count],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black87,
        items: _items,
        currentIndex: _count,
        onTap: (value) {
          setState(() {
            _count = value;
          });
        },
      ),
    );
  }
}
