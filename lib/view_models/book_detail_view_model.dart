import 'package:flutter/material.dart';
import 'package:google_books_client/models/book_model.dart';
import 'package:google_books_client/services/book_service.dart';

class BookDetailViewModel extends ChangeNotifier {
  final BookService _bookService = BookService();

  Book? _book;
  bool _isLoading = false;
  List<Book> _publisherBooks = [];

  Book? get book => _book;

  bool get isLoading => _isLoading;

  List<Book> get publisherBooks => _publisherBooks;

  Future<void> loadBook(String id) async {
    // do not reload the loaded book.
    if (_isLoading || _book?.id == id) return;
    _isLoading = true;
    notifyListeners();

    final response = await _bookService.fetchBookByID(id);
    _book = response;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadPublishersBooks(String? publisher) async {
    if(publisher!.isEmpty) return;
    final response = await _bookService.fetchBooksByPublisher(publisher);

    if (response.data != null) {
      _publisherBooks = response.data!.items;
    }
    notifyListeners();
  }
}
