import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/openlibrary_service.dart';
import 'book_details_page.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  final OpenLibraryService _service = OpenLibraryService();
  final List<String> _subjects = [
    'fiction',
    'fantasy',
    'science_fiction',
    'mystery',
    'romance',
    'thriller',
    'horror',
    'biography',
    'history',
    'poetry',
  ];

  String _selectedSubject = 'fiction';
  List<Book> _books = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchBooksBySubject();
  }

  Future<void> _fetchBooksBySubject() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final books = await _service.getBooksBySubject(_selectedSubject);
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
        Container(
          padding: const EdgeInsets.all(16),
          child: DropdownButtonFormField<String>(
            value: _selectedSubject,
            decoration: InputDecoration(
              labelText: 'Select Subject',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: _subjects.map((subject) {
              return DropdownMenuItem(
                value: subject,
                child: Text(subject.replaceAll('_', ' ').toUpperCase()),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedSubject = value;
                });
                _fetchBooksBySubject();
              }
            },
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
                            onPressed: _fetchBooksBySubject,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: _fetchBooksBySubject,
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
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
        ),
      ],
    );
  }
}
