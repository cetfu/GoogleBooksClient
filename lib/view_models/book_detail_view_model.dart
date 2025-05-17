import 'package:flutter/material.dart';
import 'package:google_books_client/models/book_model.dart';
import 'package:google_books_client/services/book_service.dart';

class BookDetailViewModel extends ChangeNotifier {
  final BookService _bookService = BookService();

  Book? _book;
  bool _isLoading = false;

  Book? get book => _book;
  bool get isLoading => _isLoading;

  Future<void> loadBook(String id) async {
    if(_isLoading) return;
    _isLoading = true;
    notifyListeners();

    final response = await _bookService.fetchBookByID(id);
    _book = response;
    _isLoading = false;
    notifyListeners();
  }
}
