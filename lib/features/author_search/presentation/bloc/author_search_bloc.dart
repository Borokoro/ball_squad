import 'package:ball_squad/core/error/failures.dart';
import 'package:ball_squad/features/author_search/data/models/author_search_data_model.dart';
import 'package:ball_squad/features/author_search/domain/usecases/fetch_author_search_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'author_search_event.dart';
part 'author_search_state.dart';

class AuthorSearchBloc extends Bloc<AuthorSearchEvent, AuthorSearchState> {
  final FetchAuthorSearchUseCase fetchAuthorSearchUseCase;
  AuthorSearchBloc({required this.fetchAuthorSearchUseCase}) : super(const AuthorSearchInitialState()) {
      on<AuthorFetchSearchResultEvent>(_onAuthorFetchSearchResultEvent);
      on<AuthorClearSearchResultEvent>(_onAuthorClearSearchResultEvent);
  }
  _onAuthorFetchSearchResultEvent(
      AuthorFetchSearchResultEvent event, Emitter<AuthorSearchState> emit) async {
    emit(const AuthorSearchLoading());
    final Either<Failure, List<AuthorSearchDataModel>> result =
    await fetchAuthorSearchUseCase.call(event.searchPhrase);
    result.fold((l) => emit(AuthorSearchError(message: l.toString())), (r) {
      emit(AuthorSearchLoaded(data: r));
    });
  }

  _onAuthorClearSearchResultEvent(
      AuthorClearSearchResultEvent event, Emitter<AuthorSearchState> emit) {
    emit(const AuthorSearchInitialState());
  }
}
