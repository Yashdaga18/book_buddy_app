import '../models/book.dart';

class BookService {
  static List<Book> getBooks() {
    return [
      Book(id: '1', title: 'To Kill a Mockingbird', author: 'Harper Lee'),
      Book(id: '2', title: '1984', author: 'George Orwell'),
      Book(id: '3', title: 'Pride and Prejudice', author: 'Jane Austen'),
      // Add more books as needed
    ];
  }
}
