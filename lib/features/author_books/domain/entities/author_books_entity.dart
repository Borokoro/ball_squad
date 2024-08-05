import 'package:equatable/equatable.dart';

class AuthorBooksEntity extends Equatable {
  final String title;

  const AuthorBooksEntity({
    required this.title,
  });

  @override
  List<Object?> get props => [
    title,
  ];
}
