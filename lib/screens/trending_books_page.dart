import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/openlibrary_service.dart';
import 'book_details_page.dart';

class TrendingBooksPage extends StatefulWidget {
  const TrendingBooksPage({super.key});

  @override
  State<TrendingBooksPage> createState() => _TrendingBooksPageState();
}

class _TrendingBooksPageState extends State<TrendingBooksPage> {
  final OpenLibraryService _service = OpenLibraryService();
  List<Book> _books = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchTrendingBooks();
  }

  Future<void> _fetchTrendingBooks() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final books = await _service.getTrendingBooks();
      setState(() {
        _books = books;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: $_error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchTrendingBooks,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _fetchTrendingBooks,
      child: ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) {
          final book = _books[index];
          return ListTile(
            leading: book.coverUrl != null
                ? Image.network(
                    book.coverUrl!,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.book, size: 50),
                  )
                : const Icon(Icons.book, size: 50),
            title: Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              book.authors.join(', '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: book.firstPublishYear != null
                ? Text('${book.firstPublishYear}')
                : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsPage(bookKey: book.key),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
