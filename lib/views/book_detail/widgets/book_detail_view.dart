import 'package:flutter/material.dart';
import 'package:google_books_client/core/common/flexible_html_markdown.dart';
import 'package:google_books_client/models/book_model.dart';
import 'package:google_books_client/models/favourite_model.dart';
import 'package:google_books_client/view_models/book_detail_view_model.dart';
import 'package:google_books_client/view_models/favourite_books_view_model.dart';
import 'package:google_books_client/views/book_detail/widgets/other_books_from_publisher.dart';
import 'package:provider/provider.dart';

class BookDetailView extends StatefulWidget {
  const BookDetailView({super.key, required this.book});

  final Book? book;

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> {
  @override
  void initState() {
    super.initState();
    final vm = Provider.of<BookDetailViewModel>(context, listen: false);
    String? publisher = widget.book!.volumeInfo.publisher;
    vm.loadPublishersBooks(publisher);
  }

  Widget _getBookThumbnail(String? thumbnail) {
    if (thumbnail == null || thumbnail.isEmpty) {
      return Image(
        image: AssetImage("assets/book_not_found.png"),
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }

    return Image.network(thumbnail, fit: BoxFit.cover, width: double.infinity);
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
      publishedDate: book.volumeInfo.publishedDate,
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
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: _getBookThumbnail(book.volumeInfo.imageLinks?.thumbnail),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      book.volumeInfo.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "${_getAuthors(book.volumeInfo.authors)} ${book.volumeInfo.publishedDate}",
                    ),
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
          if (book.volumeInfo.description != null)
            Row(
              children: [
                FlexibleHtmlMarkdown(data: book.volumeInfo.description),
              ],
            ),
          if (book.volumeInfo.description != null) Divider(),
          OtherBooksFromPublisher(),
        ],
      ),
    );
  }
}
