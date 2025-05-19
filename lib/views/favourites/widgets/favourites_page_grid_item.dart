import 'package:flutter/material.dart';
import 'package:google_books_client/models/favourite_model.dart';
import 'package:google_books_client/core/common/book_list_item.dart';

class FavouritesPageGridItem extends StatelessWidget {
  final Favourite favourite;

  const FavouritesPageGridItem({super.key, required this.favourite});

  @override
  Widget build(BuildContext context) {
    return BookListItem(
      id: favourite.id,
      title: favourite.title,
      thumbnail: favourite.thumbnail,
      authors: favourite.authors,
      publishedDate: favourite.publishedDate,
    );
  }
}
