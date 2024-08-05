import 'package:ball_squad/features/author_books/domain/entities/author_books_entity.dart';

class AuthorBooksDataModel extends AuthorBooksEntity {
  const AuthorBooksDataModel({
    required super.title,
  });

  factory AuthorBooksDataModel.fromApi(Map<String, dynamic> json) {
    return AuthorBooksDataModel(
      title: json['title'],
    );
  }
}
