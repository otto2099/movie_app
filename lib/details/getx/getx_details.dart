import 'package:get/get.dart';
import 'package:movie_app/details/models/details_model.dart';
import 'package:movie_app/details/repository/details_repository.dart';

class DetailsGetx extends GetxController {
  final _repository = DetailsRepository();

  final details = <DetailsModel>[].obs;

  Future<DetailsModel> getPopularGetx(String movieId) async {
    final req = await _repository.getDetails(movieId);
    details.add(req);
    return req;
  }
}
