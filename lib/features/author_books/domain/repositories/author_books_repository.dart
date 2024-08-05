import 'package:ball_squad/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/author_books_data_model.dart';

abstract class AuthorBooksRepository {
  Future<Either<Failure, List<AuthorBooksDataModel>>> fetchAuthorBooks(
      String authorId);
}
