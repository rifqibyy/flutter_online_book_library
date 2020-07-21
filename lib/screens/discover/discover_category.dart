import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:online_library/components/book_card.dart';
import 'package:online_library/models/books.dart';

class DiscoverCategory extends StatelessWidget {
  final String text;
  DiscoverCategory(this.text);

  @override
  Widget build(BuildContext context) {
    final List _books = Provider.of<Books>(context).books;
    return ListView.builder(
      itemCount: _books.length,
      itemBuilder: (context, i) => BookCard(_books[i]),
    );
  }
}
