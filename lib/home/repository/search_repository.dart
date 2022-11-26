import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:movie_app/home/repository/search_api.dart';

class SearchRepository {
  final _serviceAPI = SearchAPI();

  Future<MovieModel> getSearch(String value) async =>
      await _serviceAPI.searchMovie(value);
}
