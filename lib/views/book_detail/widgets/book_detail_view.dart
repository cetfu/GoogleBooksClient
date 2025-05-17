import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_books_client/models/book_model.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({super.key, required this.book});

  final Book? book;

  String _getBookThumbnail(ImageLinks? imageLinks) {
    if (imageLinks != null && imageLinks.thumbnail != null) {
      return imageLinks.thumbnail!;
    }
    return "";
  }

  String _getAuthors(List<String>? authors) {
    if (authors == null) return "Bilinmeyen Yazar";
    return authors.join(", ");
  }

  void _onFavourite() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                _getBookThumbnail(book?.volumeInfo.imageLinks),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book!.volumeInfo.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(_getAuthors(book!.volumeInfo.authors)),
                    ],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Flexible(
                    child: Html(
                      data: "${book!.volumeInfo.description}",
                      style: {
                        "*": Style(
                          margin: Margins.zero,
                          padding: HtmlPaddings.zero,
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
