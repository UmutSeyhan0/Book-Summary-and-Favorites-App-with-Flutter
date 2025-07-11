import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr/screen/bookdetailscreen.dart';
import '../components/bookcard.dart';
import '../models/book.dart'; // eğer model dosyasını ayrı tuttuysan

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  Future<List<Book>> fetchBooks() async {
    final snapshot = await FirebaseFirestore.instance.collection('books').get();
    return snapshot.docs.map((doc) => Book.fromMap(doc.data())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Book>>(
        future: fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          }
 
          final books = snapshot.data ?? [];

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return BookCard(
                 book: book,
                 onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen(book: book)));
                 },
              );
            },
          );
        },
      ),
    );
  }
}
