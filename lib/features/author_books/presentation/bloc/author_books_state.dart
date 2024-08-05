part of 'author_books_bloc.dart';

class AuthorBooksState extends Equatable{
  final List<AuthorBooksDataModel> data;
  const AuthorBooksState({this.data=const []});

  @override
  List<Object> get props => [
    data,
  ];
}

class AuthorBooksLoading extends AuthorBooksState{
  const AuthorBooksLoading();
  @override
  List<Object> get props => [];
}

class AuthorBooksError extends AuthorBooksState {
  final String message;
  const AuthorBooksError({required this.message});

  @override
  List<Object> get props => [message];
}
