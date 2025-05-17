import 'package:flutter/material.dart';
import 'package:google_books_client/core/common/layout_view.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutView(child: Text("Book Details")));
  }
}
