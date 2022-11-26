import 'package:get/get.dart';
import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:movie_app/home/repository/popular_repository.dart';

class PopularGetx extends GetxController {
  final _repository = PopularRepository();

  final popular = <MovieModel>[].obs;

  PopularGetx() {
    getPopularGetx();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getPopularGetx();
  }

  Future<void> getPopularGetx() async {
    final req = await _repository.getPopular();
    popular.add(req);
  }
}
