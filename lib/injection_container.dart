import 'package:ball_squad/features/author_books/data/datasources/author_books_remote_data_source.dart';
import 'package:ball_squad/features/author_books/data/repository/author_books_repository_impl.dart';
import 'package:ball_squad/features/author_books/domain/repositories/author_books_repository.dart';
import 'package:ball_squad/features/author_books/domain/usecases/fetch_author_books_usecase.dart';
import 'package:ball_squad/features/author_books/presentation/bloc/author_books_bloc.dart';
import 'package:ball_squad/features/author_search/data/datasources/author_search_remote_data_source.dart';
import 'package:ball_squad/features/author_search/data/repository/author_search_repository_impl.dart';
import 'package:ball_squad/features/author_search/domain/repositories/author_search_repository.dart';
import 'package:ball_squad/features/author_search/domain/usecases/fetch_author_search_usecase.dart';
import 'package:ball_squad/features/author_search/presentation/bloc/author_search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:requests_inspector/requests_inspector.dart';

final locator = GetIt.instance;

void setupLocator() {

  //bloc
  locator.registerFactory(
      () => AuthorSearchBloc(fetchAuthorSearchUseCase: locator()));
  locator.registerFactory(
      () => AuthorBooksBloc(fetchAuthorBooksUseCase: locator()));

  //use-cases
  locator.registerLazySingleton(
      () => FetchAuthorSearchUseCase(authorSearchRepository: locator()));
  locator.registerLazySingleton(
      () => FetchAuthorBooksUseCase(authorBooksRepository: locator()));

  //repositories
  locator.registerLazySingleton<AuthorSearchRepository>(() =>
      AuthorSearchRepositoryImpl(authorSearchRemoteDataSource: locator()));
  locator.registerLazySingleton<AuthorBooksRepository>(
      () => AuthorBooksRepositoryImpl(authorBooksRemoteDataSource: locator()));

  //data-sources
  locator.registerLazySingleton<AuthorSearchRemoteDataSource>(
      () => AuthorSearchRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<AuthorBooksRemoteDataSource>(
      () => AuthorBooksRemoteDataSourceImpl(dio: locator()));

  locator.registerLazySingleton(
      () => Dio()..interceptors.add(RequestsInspectorInterceptor()));
}
