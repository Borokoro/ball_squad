import 'package:ball_squad/core/error/exceptions.dart';
import 'package:ball_squad/core/error/failures.dart';
import 'package:ball_squad/features/author_books/data/datasources/author_books_remote_data_source.dart';
import 'package:ball_squad/features/author_books/domain/repositories/author_books_repository.dart';
import 'package:dartz/dartz.dart';

import '../models/author_books_data_model.dart';

class AuthorBooksRepositoryImpl extends AuthorBooksRepository{
  final AuthorBooksRemoteDataSource authorBooksRemoteDataSource;

  AuthorBooksRepositoryImpl({required this.authorBooksRemoteDataSource});

  @override
  Future<Either<Failure, List<AuthorBooksDataModel>>> fetchAuthorBooks(String authorId) async {
    try{
      final result=await authorBooksRemoteDataSource.fetchAuthorBooks(authorId);
      return Right(result);
    } on ApiException{
      return const Left(ApiFailure("Failed to fetch authors"));
    } on Exception{
      return const Left(ApiFailure("Failed to fetch authors"));
    }
  }
}