import 'package:movie_app/details/models/details_model.dart';
import 'package:movie_app/details/repository/details_api.dart';

class DetailsRepository {
  final _serviceAPI = DetailsAPI();
  Future<DetailsModel> getDetails(String movieId) async =>
      await _serviceAPI.getDetails(movieId);
}
