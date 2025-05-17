import 'package:flutter/material.dart';
import 'package:google_books_client/models/book_model.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({super.key, required this.book});

  final Book? book;

  @override
  Widget build(BuildContext context) {
    return Text("Book detail");
  }
}
