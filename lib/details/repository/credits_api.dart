import 'package:movie_app/common/enviroment.dart';
import 'package:movie_app/details/models/credits_model.dart';
import 'package:http/http.dart' as http;

class CreditsAPI {
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(Enviroment.ulrBase, endpoint, {
      'api_key': Enviroment.apiKey,
      'language': 'es-ES',
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }

  Future<CreditsModel> getCredits(String movieId) async {
    try {
      final bodyResponse = await _getJsonData('3/movie/$movieId/credits');
      final model = CreditsModel.fromJson(bodyResponse);
      return model;
    } catch (e) {
      return CreditsModel(id: 0, crew: [], cast: []);
    }
  }
}
