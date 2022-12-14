import 'package:get/get.dart';
import 'package:movie_app/details/getx/getx_credits.dart';
import 'package:movie_app/details/getx/getx_details.dart';

class CreditsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreditsGetx>(CreditsGetx());
    Get.put<DetailsGetx>(DetailsGetx());
  }
}
