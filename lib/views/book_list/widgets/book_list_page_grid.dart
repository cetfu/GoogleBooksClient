import 'package:flutter/material.dart';
import 'package:google_books_client/view_models/book_list_view_model.dart';
import 'package:google_books_client/core/common/book_list_item.dart';
import 'package:provider/provider.dart';

class BookListPageGrid extends StatefulWidget {
  const BookListPageGrid({super.key});

  @override
  State<StatefulWidget> createState() => _BookListPageGridState();
}

class _BookListPageGridState extends State<BookListPageGrid> {
  final ScrollController _scrollController = ScrollController();

  final SliverGridDelegate _gridDelegate =
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 5,
      );

  Widget? _itemBuilder(BuildContext context, int index) {
    final vm = Provider.of<BookListViewModel>(context, listen: false);
    final book = vm.books[index];
    String bookID = book.id;
    String bookTitle = book.volumeInfo.title;
    String bookThumbnail = book.volumeInfo.imageLinks?.thumbnail ?? "";
    List<String>? authors = book.volumeInfo.authors;
    String? publishedDate = book.volumeInfo.publishedDate;

    return BookListItem(
      id: bookID,
      title: bookTitle,
      thumbnail: bookThumbnail,
      authors: authors,
      publishedDate: publishedDate,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final vm = Provider.of<BookListViewModel>(context, listen: false);

      if (!vm.isLoading && vm.hasMore) {
        await vm.loadMoreBooks();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookListViewModel>(
      builder: (context, vm, child) {
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                itemCount: vm.books.length,
                gridDelegate: _gridDelegate,
                itemBuilder: _itemBuilder,
              ),
            ),
            if (vm.isLoading)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}
