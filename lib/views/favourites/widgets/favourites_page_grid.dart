import 'package:flutter/cupertino.dart';
import 'package:google_books_client/models/favourite_model.dart';
import 'package:google_books_client/views/favourites/widgets/favourites_page_grid_item.dart';

class FavouritesPageGrid extends StatelessWidget {
  final List<Favourite> favourites;

  const FavouritesPageGrid({super.key, required this.favourites});

  final SliverGridDelegateWithFixedCrossAxisCount _gridDelegate =
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 5,
      );

  Widget? _itemBuilder(BuildContext context, int index) {
    Favourite favourite = favourites[index];

    return FavouritesPageGridItem(favourite: favourite);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: favourites.length,
      gridDelegate: _gridDelegate,
      itemBuilder: _itemBuilder,
    );
  }
}
