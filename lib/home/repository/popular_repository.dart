import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:movie_app/home/repository/popular_api.dart';

class PopularRepository {
  final _serviceAPI = PopularAPI();

  Future<MovieModel> getPopular() async => await _serviceAPI.getPopular();
}
