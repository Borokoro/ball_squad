import 'package:ball_squad/core/error/exceptions.dart';
import 'package:ball_squad/features/author_search/data/models/author_search_data_model.dart';
import 'package:dio/dio.dart';
import 'package:ball_squad/core/constants/constants.dart' as c;

abstract class AuthorSearchRemoteDataSource{
  Future<List<AuthorSearchDataModel>> fetchAuthors(String authorName);
}

class AuthorSearchRemoteDataSourceImpl extends AuthorSearchRemoteDataSource{
  final Dio dio;
  AuthorSearchRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<AuthorSearchDataModel>> fetchAuthors(String authorName) async{
    List<AuthorSearchDataModel> dataFromApi=[];
    try{
      final response=await dio.get(
        '${c.gateway}search/authors.json?q=$authorName'
      );
      if(response.statusCode==200){
        for(var element in response.data["docs"]){
          dataFromApi.add(AuthorSearchDataModel.fromApi(element));
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