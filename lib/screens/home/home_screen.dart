import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:online_library/components/book_card.dart';
import 'package:online_library/models/book.dart';
import 'package:online_library/models/books.dart';
import 'package:online_library/screens/home/components/home_banner.dart';
import 'package:online_library/screens/home/components/home_header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final books = Provider.of<Books>(context).books;
    final reversedBooks = Provider.of<Books>(context).books.reversed.toList();
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeBanner(),
            HomeHeader(
              left: 'Popular',
              right: 'more >',
              fun: null,
            ),
            Container(
              height: 230,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, i) {
                    return Container(
                      height: 170,
                      width: 130,
                      margin: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            height: 180,
                            width: 130,
                            color: Colors.grey,
                            child: Image.asset(
                              books[i].img,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            books[i].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            HomeHeader(
              left: 'Books',
              right: 'more >',
              fun: null,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: reversedBooks.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider<Book>.value(
                  value: reversedBooks[i],
                  child: BookCard(reversedBooks[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
