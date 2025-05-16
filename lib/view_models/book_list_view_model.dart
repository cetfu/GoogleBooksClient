import 'package:flutter/material.dart';
import 'package:google_books_client/models/book_model.dart';
import 'package:google_books_client/services/book_service.dart';

class BookListViewModel extends ChangeNotifier {
  final BookService _bookService = BookService();
  List<Book> _books = [];
  bool _isLoaded = false;
  String? _error = "";

  List<Book> get books => _books;

  bool get isLoaded => _isLoaded;

  String? get error => _error;

  Future<void> loadBooks(String query) async {
    if (_isLoaded) return;
    final response = await _bookService.fetchBooks(query);
    if(response.data != null){
      _books = response.data!.items;
    } else if(response.error != null){
      _error = response.error?.error.message;
    }
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> reFetchBooks(String query) async {
    _isLoaded = false;
    _error = "";
    await loadBooks(query);
  }
}
