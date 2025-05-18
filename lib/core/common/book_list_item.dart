import 'package:flutter/material.dart';
import 'package:google_books_client/view_models/book_detail_view_model.dart';
import 'package:google_books_client/views/book_detail/book_detail_page.dart';
import 'package:provider/provider.dart';

class BookListItem extends StatelessWidget {
  final String id;
  final String title;
  final String? thumbnail;
  final List<String>? authors;

  const BookListItem({
    super.key,
    required this.id,
    required this.title,
    this.thumbnail,
    required this.authors,
  });

  String _getAuthors(List<String>? authors) {
    if (authors == null) return "";

    if (authors.length > 1) {
      return "${authors.first}...";
    }
    return authors.first;
  }

  String _getTitle(String title) {
    if (title.length > 50) {
      return "${title.substring(0, 50)}...";
    }
    return title;
  }

  final TextStyle _titleStyle = const TextStyle(fontWeight: FontWeight.w700);
  final TextStyle _authorsStyle = const TextStyle(color: Colors.grey);

  void _onTap(BuildContext context, String id) {
    final vm = Provider.of<BookDetailViewModel>(context, listen: false);

    //Preload mechanism
    vm.loadBook(id);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BookDetailPage(id: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context, id),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                thumbnail!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_getTitle(title), style: _titleStyle),
              Text(_getAuthors(authors), style: _authorsStyle),
            ],
          ),
        ],
      ),
    );
  }
}
