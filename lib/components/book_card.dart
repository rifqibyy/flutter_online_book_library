import 'package:flutter/material.dart';
import 'package:online_library/models/book.dart';
import 'package:online_library/screens/book/book_screen.dart';
import 'package:provider/provider.dart';

class BookCard extends StatelessWidget {
  final book;
  BookCard(this.book);

  @override
  Widget build(BuildContext context) {
    // var book = Provider.of<Book>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookScreen(
              book: book,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(14, 40, 14, 20),
            width: double.infinity,
            height: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 2.0,
                    spreadRadius: 2,
                    color: Color.fromRGBO(0, 0, 0, 0.1)),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 10,
            child: Container(
              width: 100,
              height: 150,
              child: Hero(
                tag: book.id,
                child: Image.asset(book.img),
              ),
            ),
          ),
          Positioned(
            left: 130,
            top: 55,
            child: Container(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'By ${book.author}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    book.desc,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
