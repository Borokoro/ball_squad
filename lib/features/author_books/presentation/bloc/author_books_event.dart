part of 'author_books_bloc.dart';

class AuthorBooksEvent extends Equatable{
  const AuthorBooksEvent();

  @override
  List<Object> get props => [];
}

class FetchAuthorBooksEvent extends AuthorBooksEvent{
  final String authorId;
  const FetchAuthorBooksEvent({required this.authorId});

  @override
  List<Object> get props => [authorId];
}
