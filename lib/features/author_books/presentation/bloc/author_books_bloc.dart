import 'package:ball_squad/core/error/failures.dart';
import 'package:ball_squad/features/author_books/data/models/author_books_data_model.dart';
import 'package:ball_squad/features/author_books/domain/usecases/fetch_author_books_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'author_books_event.dart';
part 'author_books_state.dart';

class AuthorBooksBloc extends Bloc<AuthorBooksEvent, AuthorBooksState> {
  final FetchAuthorBooksUseCase fetchAuthorBooksUseCase;
  AuthorBooksBloc({required this.fetchAuthorBooksUseCase}) : super(const AuthorBooksState()) {
    on<FetchAuthorBooksEvent>(_onFetchAuthorBooksEvent);
  }

  _onFetchAuthorBooksEvent(FetchAuthorBooksEvent event, Emitter<AuthorBooksState> emit) async{
    emit(const AuthorBooksLoading());
    final Either<Failure, List<AuthorBooksDataModel>> result= await fetchAuthorBooksUseCase.call(event.authorId);
    result.fold((l)=> emit(AuthorBooksError(message: l.toString())), (r) => emit(AuthorBooksState(data: r)));
  }
}
