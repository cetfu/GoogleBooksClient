import 'dart:convert';

import 'package:google_books_client/models/favourite_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteService {
  final String _favouritesKey = "favourites";
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future<List<Favourite>> getFavourites() async {
    final List<String>? jsonList = await asyncPrefs.getStringList(
      _favouritesKey,
    );
    if (jsonList == null) return [];

    return jsonList
        .map((jsonStr) => Favourite.fromJson(jsonDecode(jsonStr)))
        .toList();
  }

  void _saveFavourites(List<Favourite> favourites) async {
    final List<String> jsonList =
        favourites.map((favourite) => jsonEncode(favourite.toJson())).toList();
    await asyncPrefs.setStringList('favourites', jsonList);
  }

  void toggleFavourite(Favourite fav) async {
    final favourites = await getFavourites();
    final existing =
        favourites.where((favourite) => favourite.id == fav.id).toList();

    if (existing.isNotEmpty) {
      favourites.removeWhere((favourite) => favourite.id == fav.id);
    } else {
      favourites.add(fav);
    }

    _saveFavourites(favourites);
  }

  Future<bool> isFavorite(String id) async {
    final favourites = await getFavourites();
    return favourites.any((favourite) => favourite.id == id);
  }
}
