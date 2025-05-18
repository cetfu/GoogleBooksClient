import 'package:flutter/material.dart';
import 'package:google_books_client/core/common/circular_progress_indicator_with_center.dart';
import 'package:google_books_client/core/common/layout_view.dart';
import 'package:google_books_client/view_models/favourite_books_view_model.dart';
import 'package:google_books_client/views/favourites/widgets/favourites_page_grid.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FavouriteBooksViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.loadFavourites();
    });

    return Scaffold(
      body: LayoutView(
        child: Consumer<FavouriteBooksViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return CircularProgressIndicatorWithCenter();
            }

            return FavouritesPageGrid(favourites: vm.favourites);
          },
        ),
      ),
    );
  }
}
