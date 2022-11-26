import 'package:get/get.dart';
import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:movie_app/home/repository/top_rated_repository.dart';

class TopRatedGetx extends GetxController {
  final _topRatedRepository = TopRatedRepository();

  final topRatedList = <MovieModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getTopRatedGetx();
  }

  Future<void> getTopRatedGetx() async {
    final resultTopRated = await _topRatedRepository.getTopRated();
    topRatedList.add(resultTopRated);
  }
}
