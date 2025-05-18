import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_books_client/models/book_model.dart';
import 'package:google_books_client/models/favourite_model.dart';
import 'package:google_books_client/view_models/favourite_books_view_model.dart';
import 'package:provider/provider.dart';

class BookDetailView extends StatefulWidget {
  const BookDetailView({super.key, required this.book});

  final Book? book;

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> {
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

  void _onFavourite(BuildContext context, Book book, bool isFavourite) {
    final vm = Provider.of<FavouriteBooksViewModel>(context, listen: false);

    Favourite favourite = Favourite(
      id: book.id,
      title: book.volumeInfo.title,
      thumbnail: book.volumeInfo.imageLinks!.thumbnail,
      authors: book.volumeInfo.authors,
    );
    vm.toggleFavorite(favourite);
  }

  Widget _getFavouriteIcon(bool isFavourite) {
    if (isFavourite) {
      return const Icon(Icons.favorite, color: Colors.red);
    } else {
      return const Icon(Icons.favorite_border_outlined);
    }
  }

  Widget _getIconButton(BuildContext context, Book book, bool isFavourite) {
    return IconButton(
      onPressed: () => _onFavourite(context, book, isFavourite),
      icon: _getFavouriteIcon(isFavourite),
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    final isFavourite = Provider.of<FavouriteBooksViewModel>(
      context,
    ).isFavourite(book!.id);

    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                _getBookThumbnail(book.volumeInfo.imageLinks),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.volumeInfo.title,
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
                  FutureBuilder(
                    future: isFavourite,
                    builder: (context, snapshot) {
                      final isFavourite = snapshot.data ?? false;

                      return _getIconButton(context, book, isFavourite);
                    },
                  ),
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
        ],
      ),
    );
  }
}
