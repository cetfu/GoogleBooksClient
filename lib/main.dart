import 'package:flutter/material.dart';
import 'package:google_books_client/app.dart';
import 'package:google_books_client/view_models/book_detail_view_model.dart';
import 'package:google_books_client/view_models/book_list_view_model.dart';
import 'package:google_books_client/view_models/favourite_books_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookListViewModel()),
        ChangeNotifierProvider(create: (_) => BookDetailViewModel()),
        ChangeNotifierProvider(create: (_) => FavouriteBooksViewModel()),
      ],
      child: const GoogleBooksClient(),
    ),
  );
}
