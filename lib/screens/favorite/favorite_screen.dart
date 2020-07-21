import 'package:flutter/material.dart';
import 'package:online_library/components/book_card.dart';
import 'package:online_library/models/books.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var books = Provider.of<Books>(context);
    var favorites = books.favoriteBooks;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Favorite Books',
          style: TextStyle(color: Colors.black87),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: favorites.length <= 0
          ? Center(
              child: Text('No Favorite'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return BookCard(favorites[index]);
              },
            ),
    );
  }
}
