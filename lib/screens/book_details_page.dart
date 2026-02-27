import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/openlibrary_service.dart';

class BookDetailsPage extends StatefulWidget {
  final String bookKey;

  const BookDetailsPage({super.key, required this.bookKey});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  final OpenLibraryService _service = OpenLibraryService();
  BookDetails? _bookDetails;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchBookDetails();
  }

  Future<void> _fetchBookDetails() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final details = await _service.getBookDetails(widget.bookKey);
      setState(() {
        _bookDetails = details;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        elevation: 0,
      ),
      body: _isLoading
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
                        onPressed: _fetchBookDetails,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_bookDetails!.coverUrl != null)
                        Center(
                          child: Image.network(
                            _bookDetails!.coverUrl!,
                            height: 300,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Icon(
                              Icons.book,
                              size: 150,
                            ),
                          ),
                        ),
                      const SizedBox(height: 24),
                      Text(
                        _bookDetails!.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'by ${_bookDetails!.authors.join(', ')}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      if (_bookDetails!.pages != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          'Pages: ${_bookDetails!.pages}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                      if (_bookDetails!.subjects != null &&
                          _bookDetails!.subjects!.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        const Text(
                          'Subjects:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _bookDetails!.subjects!
                              .map((subject) => Chip(
                                    label: Text(subject),
                                    backgroundColor: Colors.black12,
                                  ))
                              .toList(),
                        ),
                      ],
                      if (_bookDetails!.description != null) ...[
                        const SizedBox(height: 24),
                        const Text(
                          'Description:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _bookDetails!.description!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ],
                  ),
                ),
    );
  }
}
