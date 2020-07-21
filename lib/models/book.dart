import 'package:flutter/cupertino.dart';

class Book with ChangeNotifier {
  final String id;
  final String title;
  final String author;
  final String filePath;
  final String desc;
  final String img;
  bool like;

  Book({
    this.id,
    this.title,
    this.author,
    this.filePath,
    this.desc,
    this.img,
    this.like = false,
  });

  void toggleLike() {
    like = !like;
  }
}
