import 'package:flutter/material.dart';
import '../models/book.dart';

class BookListItem extends StatelessWidget {
  final Book book;

  const BookListItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          child: Text(book.title[0]),
        ),
        title: Text(
          book.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(book.author),
        trailing: Chip(
          label: Text(
            book.isAvailable ? 'Available' : 'Not Available',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: book.isAvailable ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
