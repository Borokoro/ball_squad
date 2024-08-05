import 'package:ball_squad/core/error/failures.dart';
import 'package:ball_squad/features/author_books/data/models/author_books_data_model.dart';
import 'package:ball_squad/features/author_books/domain/repositories/author_books_repository.dart';
import 'package:dartz/dartz.dart';

class FetchAuthorBooksUseCase{
  final AuthorBooksRepository authorBooksRepository;

  FetchAuthorBooksUseCase({required this.authorBooksRepository});

  Future<Either<Failure, List<AuthorBooksDataModel>>> call(String authorId){
    return authorBooksRepository.fetchAuthorBooks(authorId);
  }
}