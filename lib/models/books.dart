import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:online_library/models/book.dart';

class Books with ChangeNotifier {
  List<Book> _book = [
    Book(
      id: '1',
      title: 'Abraham Lincoln',
      author: 'Thomas Mears Eddy',
      filePath: 'assets/files/abraham_lincoln.pdf',
      desc:
          '''Delivered at a Union Meeting, held in the Presbyterian Church, Waukegan Illinois, Wednesday, April 19, 1865, the day upon which the funeral services of the president were conducted in Washington, and observed throughout the loyal states as one of mourning.''',
      img: 'assets/images/abraham_lincoln.jpg',
    ),
    Book(
      id: '2',
      title: 'Acres of Diamonds',
      author: 'Rifqi Abiyyu',
      filePath: 'assets/files/acres_of_diamonds.pdf',
      desc:
          'Enim ipsum tempor nulla magna mollit fugiat quis excepteur elit culpa duis.',
      img: 'assets/images/acres_of_diamonds.jpg',
    ),
    Book(
      id: '3',
      title: 'Crime and Punishment',
      author: 'Rifqi Abiyyu',
      filePath: 'assets/files/crime_and_punishment.pdf',
      desc:
          'Enim ipsum tempor nulla magna mollit fugiat quis excepteur elit culpa duis.',
      img: 'assets/images/crime_and_punishment.jpg',
    ),
    Book(
      id: '4',
      title: 'Mohammed the Prophet of Islam',
      author: 'Rifqi Abiyyu',
      filePath: 'assets/files/mohammed_the_prophet_of_islam.pdf',
      desc:
          'Enim ipsum tempor nulla magna mollit fugiat quis excepteur elit culpa duis.',
      img: 'assets/images/mohammed_the_prophet_of_islam.jpg',
    ),
    Book(
      id: '5',
      title: 'The Adventures of Sherlock Holmes',
      author: 'Rifqi Abiyyu',
      filePath: 'assets/files/the_adventures_of_sherlock_holmes.pdf',
      desc:
          'Enim ipsum tempor nulla magna mollit fugiat quis excepteur elit culpa duis.',
      img: 'assets/images/the_adventures_of_sherlock_holmes.jpg',
    ),
  ];

  UnmodifiableListView<Book> get books {
    return UnmodifiableListView(_book);
  }

  void updateLike(Book book) {
    book.toggleLike();
    notifyListeners();
  }

  UnmodifiableListView<Book> get favoriteBooks {
    var favorite = _book.where((book) => book.like);
    return UnmodifiableListView(favorite);
  }
}
