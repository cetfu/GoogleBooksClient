import 'package:flutter/material.dart';
import 'package:google_books_client/models/book_model.dart';
import 'package:google_books_client/models/error_model.dart';
import 'package:google_books_client/services/book_service.dart';

class BookListViewModel extends ChangeNotifier {
  final BookService _bookService = BookService();
  final int _maxResults = 20;
  List<Book> _books = [];
  bool _isLoading = false;
  String? _error = "";
  int _page = 0;
  bool _hasMore = true;
  String? _lastQuery = "";

  List<Book> get books => _books;

  bool get isLoading => _isLoading;

  bool get hasMore => _hasMore;

  String? get error => _error;

  String? get lastQuery => _lastQuery;

  int get currentPage => _page;

  Future<void> loadBooks(String query, {int page = 0}) async {
    if (_isLoading || !_hasMore || query.isEmpty) return;

    _isLoading = true;
    notifyListeners();

    final startIndex = page * _maxResults;
    final response = await _bookService.fetchBooks(
      query,
      startIndex: startIndex,
      maxResults: _maxResults,
    );
    _lastQuery = query;

    if (response.data != null) {
      _handleSuccessResponse(response.data!, page);
    } else if (response.error != null) {
      _handleErrorResponse(response.error!);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> reFetchBooks(String query) async {
    if (_lastQuery == query || query.isEmpty) return;
    _isLoading = false;
    _error = "";
    _books = [];
    _page = 0;
    _hasMore = true;
    await loadBooks(query, page: 0);
    _lastQuery = query;
  }

  Future<void> loadMoreBooks() async {
    if (_isLoading || !_hasMore || _lastQuery == null || _lastQuery!.isEmpty){
      return;
    }

    final nextPage = _page + 1;
    await loadBooks(_lastQuery!, page: nextPage);
  }

  void _handleSuccessResponse(BooksResponse data, int page) {
    final items = data.items;
    if (items.isNotEmpty) {
      _books.addAll(data.items);
      _page = page;
      _hasMore = items.length == _maxResults;
    } else {
      _hasMore = false;
    }
  }

  void _handleErrorResponse(ErrorResponse error) {
    _error = error.error.message;
    _hasMore = false;
  }
}
