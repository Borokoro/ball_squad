import 'package:ball_squad/core/error/exceptions.dart';
import 'package:ball_squad/features/author_books/data/models/author_books_data_model.dart';
import 'package:dio/dio.dart';
import 'package:ball_squad/core/constants/constants.dart' as c;

abstract class AuthorBooksRemoteDataSource{
  Future<List<AuthorBooksDataModel>> fetchAuthorBooks(String authorId);
}

class AuthorBooksRemoteDataSourceImpl extends AuthorBooksRemoteDataSource{
  final Dio dio;
  AuthorBooksRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<AuthorBooksDataModel>> fetchAuthorBooks(String authorId) async{
    List<AuthorBooksDataModel> dataFromApi=[];
    try{
      final response=await dio.get(
          '${c.gateway}authors/$authorId/works.json'
      );
      if(response.statusCode==200){
        for(var element in response.data["entries"]){
          dataFromApi.add(AuthorBooksDataModel.fromApi(element));
        }
        return dataFromApi;
      }
      else{
        throw ApiException();
      }
    } on DioException catch(e){
      throw Exception("Error ${e.response}");
    }
  }
}