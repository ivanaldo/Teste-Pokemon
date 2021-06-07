import 'package:desafio/modules/search/domain/errors/errors.dart';
import 'package:desafio/modules/search/infra/datasources/search_datasouces.dart';
import 'package:desafio/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';


class GitHubDataSource implements SearchDataSource {

  final Dio dio;

  GitHubDataSource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {

    final response = await dio.get("https://pokeapi.co/api/v2/pokemon");
    if(response.statusCode == 200){
      final list = (response.data['results'] as List)
          .map((e) => ResultSearchModel.fromMap(e)).toList();

      return list;
    }else{
      throw DataSourceError();
    }

  }
//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png
}