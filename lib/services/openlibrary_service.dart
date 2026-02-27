import 'package:dio/dio.dart';
import '../models/book.dart';

class OpenLibraryService {
  final Dio dio = Dio();
  final String baseUrl = 'https://openlibrary.org';

  Future<List<Book>> searchBooks(String query) async {
    try {
      final response = await dio.get(
        '$baseUrl/search.json',
        queryParameters: {'q': query, 'limit': 20},
      );
      final docs = response.data['docs'] as List<dynamic>;
      return docs.map((e) => Book.fromJson(e)).toList();
    } catch (e, stackTrace) {
      print('Error searching books: $e');
      print('Stack Trace: $stackTrace');
      throw Exception('Failed to search books');
    }
  }

  Future<List<Book>> getTrendingBooks() async {
    try {
      final response = await dio.get('$baseUrl/trending/daily.json?limit=20');
      final works = response.data['works'] as List<dynamic>;
      return works.map((e) => Book.fromJson(e)).toList();
    } catch (e, stackTrace) {
      print('Error fetching trending books: $e');
      print('Stack Trace: $stackTrace');
      throw Exception('Failed to fetch trending books');
    }
  }

  Future<List<Book>> getBooksBySubject(String subject) async {
    try {
      final response = await dio.get(
        '$baseUrl/subjects/$subject.json',
        queryParameters: {'limit': 20},
      );
      final works = response.data['works'] as List<dynamic>;
      return works.map((e) => Book.fromJson(e)).toList();
    } catch (e, stackTrace) {
      print('Error fetching books by subject: $e');
      print('Stack Trace: $stackTrace');
      throw Exception('Failed to fetch books by subject');
    }
  }

  Future<BookDetails> getBookDetails(String workKey) async {
    try {
      final response = await dio.get('$baseUrl$workKey.json');
      return BookDetails.fromJson(response.data);
    } catch (e, stackTrace) {
      print('Error fetching book details: $e');
      print('Stack Trace: $stackTrace');
      throw Exception('Failed to fetch book details');
    }
  }

  Future<List<Book>> getAuthorBooks(String authorKey) async {
    try {
      final response = await dio.get('$baseUrl$authorKey/works.json?limit=20');
      final entries = response.data['entries'] as List<dynamic>;
      return entries.map((e) => Book.fromJson(e)).toList();
    } catch (e, stackTrace) {
      print('Error fetching author books: $e');
      print('Stack Trace: $stackTrace');
      throw Exception('Failed to fetch author books');
    }
  }
}
