class Book {
  final String title;
  final String author;
  final int year;
  final int pages;
  final String summary;
  final String imageUrl;

  Book({
    required this.title,
    required this.author,
    required this.year,
    required this.pages,
    required this.summary,
    required this.imageUrl,
  });

  factory Book.fromMap(Map<String, dynamic> data) {
    return Book(
      title: data['title'] ?? '',
      author: data['author'] ?? '',
      year: data['year'] ?? 0,
      pages: data['pages'] ?? 0,
      summary: data['summary'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
