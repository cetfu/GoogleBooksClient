import 'package:flutter/material.dart';
import 'package:google_books_client/core/common/layout_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutView(child: Text("Ana Sayfa")));
  }
}
