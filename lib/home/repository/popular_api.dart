import 'package:movie_app/common/enviroment.dart';
import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:http/http.dart' as http;

class PopularAPI {
  String _language = 'es-ES';
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(Enviroment.ulrBase, endpoint, {
      'api_key': Enviroment.apiKey,
      'language': _language,
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }

  Future<MovieModel> getPopular() async {
    try {
      final bodyResponse = await _getJsonData('3/movie/popular');
      final model = MovieModel.fromJson(bodyResponse);
      return model;
    } catch (e) {
      return MovieModel(page: 0, results: [], totalPages: 0, totalResults: 0);
    }
  }
}
