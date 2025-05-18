import 'package:flutter/material.dart';
import 'package:google_books_client/models/favourite_model.dart';
import 'package:google_books_client/services/favourite_service.dart';

class FavouriteBooksViewModel extends ChangeNotifier {
  final FavouriteService favouriteService = FavouriteService();

  List<Favourite> _favourites = [];
  bool _isLoading = false;

  List<Favourite> get favourites => _favourites;

  bool get isLoading => _isLoading;

  Future<bool> isFavourite(String bookID) {
    return favouriteService.isFavorite(bookID);
  }

  Future<void> loadFavourites() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    _favourites = await favouriteService.getFavourites();
    _isLoading = false;
    notifyListeners();
  }

  void toggleFavorite(Favourite book) async {
    _favourites = await favouriteService.toggleFavourite(book);
    notifyListeners();
  }
}
