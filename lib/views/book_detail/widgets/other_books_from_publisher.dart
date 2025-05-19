import 'package:flutter/cupertino.dart';
import 'package:google_books_client/core/common/book_list_item.dart';
import 'package:google_books_client/models/book_model.dart';
import 'package:google_books_client/view_models/book_detail_view_model.dart';
import 'package:provider/provider.dart';

class OtherBooksFromPublisher extends StatelessWidget {
  const OtherBooksFromPublisher({super.key});


  final SliverGridDelegateWithFixedCrossAxisCount _gridDelegate =
  const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 1,
    childAspectRatio: 5 / 3,
  );

  Widget? _itemBuilder(BuildContext context, int index) {
    final vm = Provider.of<BookDetailViewModel>(context, listen: false);
    Book book = vm.publisherBooks[index];

    return BookListItem(
      id: book.id,
      title: book.volumeInfo.title,
      authors: book.volumeInfo.authors,
      thumbnail: book.volumeInfo.imageLinks?.thumbnail,
      publishedDate: book.volumeInfo.publishedDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookDetailViewModel>(
      builder: (context, vm, child) {
        if(vm.publisherBooks.isEmpty){
          return SizedBox();
        }
        return Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yayıncıdan diğer kitaplar",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            SizedBox(
              height: 250,
              child: GridView.builder(
                itemCount: vm.publisherBooks.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: _gridDelegate,
                itemBuilder: _itemBuilder,
              ),
            )
          ],
        );
      },
    );
  }
}
