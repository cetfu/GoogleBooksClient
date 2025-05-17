import 'package:flutter/material.dart';
import 'package:google_books_client/views/book_detail/book_detail_page.dart';

class BookListPageGridItem extends StatelessWidget {
  final String id;
  final String title;
  final String thumbnail;
  final List<String>? authors;

  const BookListPageGridItem({
    super.key,
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.authors,
  });

  String _getAuthors(List<String>? authors) {
    if (authors == null) return "";

    if (authors.length > 1) {
      return "${authors.first}...";
    }
    return authors.first;
  }

  final TextStyle _titleStyle = const TextStyle(fontWeight: FontWeight.w700);
  final TextStyle _authorsStyle = const TextStyle(color: Colors.grey);

  void _onTap(BuildContext context, String id) {
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
                thumbnail,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: _titleStyle),
              Text(_getAuthors(authors), style: _authorsStyle),
            ],
          ),
        ],
      ),
    );
  }
}
