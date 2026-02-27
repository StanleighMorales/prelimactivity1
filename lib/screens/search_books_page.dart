import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/openlibrary_service.dart';
import 'book_details_page.dart';

class SearchBooksPage extends StatefulWidget {
  const SearchBooksPage({super.key});

  @override
  State<SearchBooksPage> createState() => _SearchBooksPageState();
}

class _SearchBooksPageState extends State<SearchBooksPage> {
  final OpenLibraryService _service = OpenLibraryService();
  final TextEditingController _searchController = TextEditingController();
  List<Book> _books = [];
  bool _isLoading = false;
  String? _error;

  Future<void> _searchBooks() async {
    if (_searchController.text.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final books = await _service.searchBooks(_searchController.text.trim());
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search for books...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    _books = [];
                  });
                },
              ),
            ),
            onSubmitted: (_) => _searchBooks(),
          ),
        ),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline,
                              size: 48, color: Colors.red),
                          const SizedBox(height: 16),
                          Text('Error: $_error'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _searchBooks,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    )
                  : _books.isEmpty
                      ? const Center(
                          child: Text('Search for books to see results'),
                        )
                      : ListView.builder(
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
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
                                    builder: (context) =>
                                        BookDetailsPage(bookKey: book.key),
                                  ),
                                );
                              },
                            );
                          },
                        ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
