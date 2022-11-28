import 'package:movie_app/details/models/credits_model.dart';
import 'package:movie_app/details/repository/credits_api.dart';

class CreditsRepository {
  final _serviceAPI = CreditsAPI();
  Future<CreditsModel> getCredits(String movieId) async =>
      await _serviceAPI.getCredits(movieId);
}
