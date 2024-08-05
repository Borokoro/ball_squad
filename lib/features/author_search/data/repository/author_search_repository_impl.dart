import 'package:ball_squad/core/error/exceptions.dart';
import 'package:ball_squad/features/author_search/data/datasources/author_search_remote_data_source.dart';
import 'package:ball_squad/features/author_search/domain/repositories/author_search_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/author_search_data_model.dart';

class AuthorSearchRepositoryImpl extends AuthorSearchRepository{
  final AuthorSearchRemoteDataSource authorSearchRemoteDataSource;

  AuthorSearchRepositoryImpl({required this.authorSearchRemoteDataSource});

  @override
  Future<Either<Failure, List<AuthorSearchDataModel>>> getAuthorSearchData(String authorName) async {
    try{
      final result=await authorSearchRemoteDataSource.fetchAuthors(authorName);
      return Right(result);
    } on ApiException{
      return const Left(ApiFailure("Failed to fetch authors"));
    } on Exception{
      return const Left(ApiFailure("Failed to fetch authors"));
    }
  }
}