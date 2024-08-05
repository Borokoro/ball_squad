part of 'author_search_bloc.dart';

class AuthorSearchState extends Equatable {
  const AuthorSearchState();

  @override
  List<Object> get props => [];
}

class AuthorSearchInitialState extends AuthorSearchState {
  final List<AuthorSearchDataModel> data;
  const AuthorSearchInitialState({this.data = const []});

  @override
  List<Object> get props => [
    data,
  ];
}

class AuthorSearchLoading extends AuthorSearchState {
  const AuthorSearchLoading();

  @override
  List<Object> get props => [];
}

class AuthorSearchError extends AuthorSearchState {
  final String message;
  const AuthorSearchError({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthorSearchLoaded extends AuthorSearchState {
  final List<AuthorSearchDataModel> data;
  const AuthorSearchLoaded({required this.data});

  @override
  List<Object> get props => [
    data,
  ];
}

