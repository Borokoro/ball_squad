import 'package:ball_squad/core/error/failures.dart';
import 'package:ball_squad/features/author_search/data/models/author_search_data_model.dart';
import 'package:ball_squad/features/author_search/domain/repositories/author_search_repository.dart';
import 'package:dartz/dartz.dart';

class FetchAuthorSearchUseCase{
  final AuthorSearchRepository authorSearchRepository;

  FetchAuthorSearchUseCase({required this.authorSearchRepository});

  Future<Either<Failure, List<AuthorSearchDataModel>>> call(String authorName){
    return authorSearchRepository.getAuthorSearchData(authorName);
  }
}