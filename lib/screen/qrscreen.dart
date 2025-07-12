import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screen/bookdetailscreen.dart';
import '../models/book.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  bool _isScanning = true;

  void _onDetect(BarcodeCapture capture) async {
    if (!_isScanning) return;
    _isScanning = false;

    final code = capture.barcodes.first.rawValue;

    if (code != null) {
      try {
        final doc = await FirebaseFirestore.instance.collection('books').doc(code).get();

        if (doc.exists) {
          final data = doc.data()!;
          final book = Book.fromFirestore(data);

          if (context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailScreen(book: book),
              ),
            );
          }
        } else {
          _showError('Kitap bulunamadı.');
        }
      } catch (e) {
        _showError('Hata: $e');
      }
    } else {
      _showError('Geçersiz QR kod.');
    }

    await Future.delayed(const Duration(seconds: 2));
    _isScanning = true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    _isScanning = true;
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Kod Tara')),
      body: MobileScanner(
        onDetect: _onDetect,
      ),
    );
  }
}