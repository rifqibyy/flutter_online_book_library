import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_library/components/my_button.dart';
import 'package:online_library/models/book.dart';
import 'package:online_library/models/books.dart';
import 'package:online_library/screens/book/read_screen.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatelessWidget {
  final Book book;
  BookScreen({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: book.id,
                    child: Image.asset(book.img),
                  ),
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'By ${book.author}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Text(
                    book.desc,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyButton(
                      child: Text('Read'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadScreen(
                              path: book.filePath,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Consumer<Books>(
                    builder: (context, myBook, child) {
                      return MyButton(
                        onPressed: () {
                          myBook.updateLike(book);
                          Fluttertoast.cancel();
                          Fluttertoast.showToast(
                            msg: book.like
                                ? 'Added To Favorite'
                                : 'Removed From Favorite',
                            backgroundColor: Colors.black,
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        },
                        child: book.like
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
