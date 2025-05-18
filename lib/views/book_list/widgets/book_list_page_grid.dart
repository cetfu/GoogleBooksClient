import 'package:flutter/material.dart';
import 'package:google_books_client/view_models/book_list_view_model.dart';
import 'package:google_books_client/core/common/book_list_item.dart';
import 'package:provider/provider.dart';

class BookListPageGrid extends StatelessWidget {
  const BookListPageGrid({super.key});

  final SliverGridDelegate _gridDelegate =
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      );

  Widget? _itemBuilder(BuildContext context, int index) {
    final vm = Provider.of<BookListViewModel>(context, listen: false);
    final book = vm.books[index];
    String bookID = book.id;
    String bookTitle = book.volumeInfo.title;
    String bookThumbnail = book.volumeInfo.imageLinks?.thumbnail ?? "";
    List<String>? authors = book.volumeInfo.authors;

    return BookListItem(
      id: bookID,
      title: bookTitle,
      thumbnail: bookThumbnail,
      authors: authors,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookListViewModel>(
      builder: (context, vm, child) {
        return GridView.builder(
          itemCount: vm.books.length,
          gridDelegate: _gridDelegate,
          itemBuilder: _itemBuilder,
        );
      },
    );
  }
}
