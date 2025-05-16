import 'package:google_books_client/models/error_model.dart';

class ApiResult<T> {
  final T? data;
  final ErrorResponse? error;

  ApiResult({this.data, this.error});
}
