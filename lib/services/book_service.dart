import 'dart:convert';

import 'package:google_books_client/core/constants/api.dart';
import 'package:google_books_client/models/api_result.dart';
import 'package:google_books_client/models/book_model.dart';
import 'package:google_books_client/models/error_model.dart';
import "package:http/http.dart" as http;

class BookService {
  Future<ApiResult<BooksResponse>> fetchBooks(String query) async {
    final uri = Uri.parse(
      Api.baseUrl,
    ).replace(queryParameters: {"q": query, "orderBy": "relevance"});
    final response = await http.get(uri);

    final jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ApiResult(data: BooksResponse.fromJson(jsonData));
    } else if (response.statusCode == 400) {
      return ApiResult(error: ErrorResponse.fromJson(jsonData));
    } else {
      throw Exception("An unknown error occurred");
    }
  }
}
