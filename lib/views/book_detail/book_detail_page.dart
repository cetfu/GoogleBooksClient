import 'package:flutter/material.dart';
import 'package:google_books_client/app.dart';
import 'package:google_books_client/core/common/circular_progress_indicator_with_center.dart';
import 'package:google_books_client/core/common/layout_view.dart';
import 'package:google_books_client/core/constants/app_strings.dart';
import 'package:google_books_client/models/book_model.dart';
import 'package:google_books_client/view_models/book_detail_view_model.dart';
import 'package:google_books_client/views/book_detail/widgets/book_detail_view.dart';
import 'package:provider/provider.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key, required this.id});

  final String id;

  @override
  State<StatefulWidget> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _loadBook();
  }

  @override
  void didPopNext() {
    _loadBook();
  }

  void _loadBook(){
    final vm = Provider.of<BookDetailViewModel>(context, listen: false);
    vm.loadBook(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.bookDetailTitle,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Consumer<BookDetailViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return CircularProgressIndicatorWithCenter();
          }
          Book? book = vm.book;

          return LayoutView(child: BookDetailView(book: book));
        },
      ),
    );
  }
}
