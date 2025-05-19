import 'package:flutter/material.dart';
import 'package:google_books_client/core/common/circular_progress_indicator_with_center.dart';
import 'package:google_books_client/core/common/layout_view.dart';
import 'package:google_books_client/core/constants/app_strings.dart';
import 'package:google_books_client/core/theme/app_sizes.dart';
import 'package:google_books_client/view_models/book_list_view_model.dart';
import 'package:google_books_client/views/book_list/widgets/book_list_page_grid.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<StatefulWidget> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  bool isSearchMode = false;
  final TextEditingController _searchQueryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final vm = Provider.of<BookListViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.loadBooks("Tolkien", page: 0);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _searchQueryController.dispose();
    super.dispose();
  }

  void _onPressSearch() {
    final vm = Provider.of<BookListViewModel>(context, listen: false);

    if (isSearchMode) {
      //disable search mode and send request
      String query = _searchQueryController.text;
      vm.reFetchBooks(query);
      setState(() {
        isSearchMode = false;
      });
    } else {
      setState(() {
        isSearchMode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            isSearchMode
                ? TextField(
                  controller: _searchQueryController,
                  decoration: InputDecoration(hintText: "Kitap adı"),
                  onSubmitted: (_) => _onPressSearch(),
                )
                : Text(
                  AppStrings.bookListTitle,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
        actions: [
          IconButton(
            onPressed: _onPressSearch,
            icon: Icon(Icons.search_outlined, size: AppSizes.iconSize),
          ),
        ],
      ),
      body: LayoutView(
        child: Consumer<BookListViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading && vm.books.isEmpty) {
              return CircularProgressIndicatorWithCenter();
            }
            return BookListPageGrid();
          },
        ),
      ),
    );
  }
}
