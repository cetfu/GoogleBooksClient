import 'package:flutter/material.dart';
import 'package:google_books_client/core/common/layout_view.dart';
import 'package:google_books_client/view_models/book_list_view_model.dart';
import 'package:google_books_client/views/book_list/widgets/book_list_page_grid.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BookListViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.loadBooks("Tolkien", page: 0);
    });

    return Scaffold(
      body: LayoutView(
        child: Consumer<BookListViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return BookListPageGrid();
          },
        ),
      ),
    );
  }
}
