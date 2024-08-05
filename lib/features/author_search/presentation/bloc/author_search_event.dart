part of 'author_search_bloc.dart';

class AuthorSearchEvent extends Equatable {
  const AuthorSearchEvent();

  @override
  List<Object> get props => [];
}

class AuthorFetchSearchResultEvent extends AuthorSearchEvent {
  final String searchPhrase;
  const AuthorFetchSearchResultEvent({required this.searchPhrase});

  @override
  List<Object> get props => [
    searchPhrase,
  ];
}

class AuthorClearSearchResultEvent extends AuthorSearchEvent {
  const AuthorClearSearchResultEvent();

  @override
  List<Object> get props => [];
}

