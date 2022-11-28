import 'package:movie_app/common/enviroment.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/details/models/details_model.dart';

class DetailsAPI {
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(Enviroment.ulrBase, endpoint, {
      'api_key': Enviroment.apiKey,
      'language': 'es-ES',
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }

  Future<DetailsModel> getDetails(String movieId) async {
    final bodyResponse = await _getJsonData('3/movie/$movieId');
    final model = DetailsModel.fromJson(bodyResponse);
    return model;
  }
}
