import 'package:flutter/material.dart';
import 'package:google_books_client/models/favourite_model.dart';
import 'package:google_books_client/services/favourite_service.dart';

class FavouriteBooksViewModel extends ChangeNotifier {
  final FavouriteService favouriteService = FavouriteService();

  Future<bool> isFavourite(String bookID){
    return favouriteService.isFavorite(bookID);
  }

  void toggleFavorite(Favourite book) {
    favouriteService.toggleFavourite(book);
    notifyListeners();
  }
}
