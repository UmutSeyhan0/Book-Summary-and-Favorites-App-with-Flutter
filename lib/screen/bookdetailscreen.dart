import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kitap Görseli
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  book.imageUrl,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Başlık
            Text(book.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                
              children: [
              Text("Yazar: ${book.author}", style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),

            // Yıl ve Sayfa
              Text("Yıl: ${book.year} • Sayfa: ${book.pages}", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
            ],
            ),
            IconButton(onPressed: () {
                  setState(() {
                    isFavorited = !isFavorited;
                  });
                  // İstersen burada Firestore'a favori olarak ekleme işlemi yapılabilir
                }, icon: Icon(
                  isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: isFavorited ? Colors.red : Colors.grey,
                  size: 36,
                ),
                ),
            ]
            ,
            ),
            // Yazar
            

         

            // Özet
            const Text("Özet", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(book.summary, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),

            // Favori Butonu
           
          ],
        ),
      ),
    );
  }
}
