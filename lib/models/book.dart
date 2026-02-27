class Book {
  final String title;
  final List<String> authors;
  final String? coverUrl;
  final int? firstPublishYear;
  final String key;
  final List<String>? subjects;

  Book({
    required this.title,
    required this.authors,
    this.coverUrl,
    this.firstPublishYear,
    required this.key,
    this.subjects,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] ?? 'Unknown Title',
      authors: (json['author_name'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          ['Unknown Author'],
      coverUrl: json['cover_i'] != null
          ? 'https://covers.openlibrary.org/b/id/${json['cover_i']}-M.jpg'
          : null,
      firstPublishYear: json['first_publish_year'],
      key: json['key'] ?? '',
      subjects: (json['subject'] as List<dynamic>?)
              ?.take(3)
              .map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

class BookDetails {
  final String title;
  final String? description;
  final List<String> authors;
  final String? coverUrl;
  final int? pages;
  final List<String>? subjects;

  BookDetails({
    required this.title,
    this.description,
    required this.authors,
    this.coverUrl,
    this.pages,
    this.subjects,
  });

  factory BookDetails.fromJson(Map<String, dynamic> json) {
    String? desc;
    if (json['description'] != null) {
      desc = json['description'] is String
          ? json['description']
          : json['description']['value'];
    }

    return BookDetails(
      title: json['title'] ?? 'Unknown Title',
      description: desc,
      authors: ['Unknown Author'],
      coverUrl: json['covers'] != null && (json['covers'] as List).isNotEmpty
          ? 'https://covers.openlibrary.org/b/id/${json['covers'][0]}-L.jpg'
          : null,
      pages: json['number_of_pages'],
      subjects: (json['subjects'] as List<dynamic>?)
              ?.take(5)
              .map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}
