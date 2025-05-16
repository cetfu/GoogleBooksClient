import 'package:flutter/material.dart';
import 'package:google_books_client/core/common/layout_view.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutView(child: Text("Ana Sayfa")));
  }
}
