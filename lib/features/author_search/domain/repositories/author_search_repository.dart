import 'package:ball_squad/core/error/failures.dart';
import 'package:ball_squad/features/author_search/data/models/author_search_data_model.dart';
import 'package:dartz/dartz.dart';
abstract class AuthorSearchRepository{
  Future<Either<Failure, List<AuthorSearchDataModel>>> getAuthorSearchData(String authorName);
}