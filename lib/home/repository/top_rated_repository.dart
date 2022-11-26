import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:movie_app/home/repository/top_rated_api.dart';

class TopRatedRepository {
  final _movieAPI = TopRatedAPI();

  Future<MovieModel> getTopRated() async => await _movieAPI.getTopRated();
}
