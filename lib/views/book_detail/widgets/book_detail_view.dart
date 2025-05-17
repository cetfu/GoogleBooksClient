import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_books_client/models/book_model.dart';

class BookDetailView extends StatefulWidget {
  const BookDetailView({super.key, required this.book});

  final Book? book;

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> {
  bool _isFavourite = false;

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

  void _onFavourite() {
    setState(() {
      _isFavourite = !_isFavourite;
    });
  }

  Widget _getFavouriteIcon(bool isFavourite) {
    if (isFavourite) {
      return const Icon(Icons.favorite, color: Colors.red);
    } else {
      return const Icon(Icons.favorite_border_outlined);
    }
  }

  Widget _getIconButton(bool isFavourite) {
    return IconButton(
      onPressed: _onFavourite,
      icon: _getFavouriteIcon(isFavourite),
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book!.volumeInfo.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(_getAuthors(book.volumeInfo.authors)),
                        ],
                      ),
                    ),
                    _getIconButton(_isFavourite),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Flexible(
                      child: Html(
                        data: book.volumeInfo.description ?? "",
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
          ),
        ],
      ),
    );
  }
}
