import 'package:flutter/material.dart';
import 'package:google_books_client/app.dart';
import 'package:google_books_client/view_models/book_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BookListViewModel())],
      child: const GoogleBooksClient(),
    ),
  );
}
