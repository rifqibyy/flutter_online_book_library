import 'package:flutter/material.dart';
import 'package:online_library/screens/discover/discover_category.dart';

class DiscoverScreen extends StatelessWidget {
  final _content = [
    'Popular',
    'Horror',
    'Romance',
    'Mystery',
    'Biography',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _content.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black87,
            tabs: _content.map((e) {
              return Tab(
                text: e,
              );
            }).toList(),
          ),
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Online Book',
            style: TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: TabBarView(
          children: _content.map((e) {
            return DiscoverCategory(e);
          }).toList(),
        ),
      ),
    );
  }
}
