import 'package:get/get.dart';
import 'package:movie_app/details/models/credits_model.dart';
import 'package:movie_app/details/repository/credits_repository.dart';

class CreditsGetx extends GetxController {
  final _repository = CreditsRepository();

  final credits = <CreditsModel>[].obs;

  Future<CreditsModel> getPopularGetx(String movieId) async {
    final req = await _repository.getCredits(movieId);
    credits.add(req);
    return req;
  }
}
