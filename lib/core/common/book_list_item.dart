import 'package:flutter/material.dart';
import 'package:google_books_client/view_models/book_detail_view_model.dart';
import 'package:google_books_client/views/book_detail/book_detail_page.dart';
import 'package:provider/provider.dart';

class BookListItem extends StatelessWidget {
  final String id;
  final String title;
  final String? thumbnail;
  final List<String>? authors;
  final String? publishedDate;

  const BookListItem({
    super.key,
    required this.id,
    required this.title,
    this.thumbnail,
    required this.authors,
    required this.publishedDate,
  });

  String _getAuthors(List<String>? authors) {
    if (authors == null) return "";

    if (authors.length > 1) {
      return "${authors.first}...";
    }
    return authors.first;
  }

  final TextStyle _titleStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    overflow: TextOverflow.ellipsis,
  );
  final TextStyle _authorsStyle = const TextStyle(
    color: Colors.grey,
    overflow: TextOverflow.ellipsis,
  );

  final TextStyle _publishedDateStyle = const TextStyle(color: Colors.grey);

  void _onTap(BuildContext context, String id) {
    final vm = Provider.of<BookDetailViewModel>(context, listen: false);

    //Preload mechanism
    vm.loadBook(id);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BookDetailPage(id: id)),
    );
  }

  Widget _getThumbnailImage(String? thumbnail) {
    if (thumbnail == null || thumbnail.isEmpty) {
      return const Image(
        image: AssetImage("assets/book_not_found.png"),
        fit: BoxFit.cover,
      );
    }

    return Image.network(thumbnail, fit: BoxFit.cover, width: double.infinity);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context, id),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _getThumbnailImage(thumbnail)),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(title, style: _titleStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(_getAuthors(authors), style: _authorsStyle)),
                      if (publishedDate != null) Text(publishedDate!, style: _publishedDateStyle,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
