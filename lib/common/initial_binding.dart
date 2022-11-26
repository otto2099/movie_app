import 'package:get/get.dart';
import 'package:movie_app/home/getx/getx_top_rated.dart';

class InitialBindingGetX extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TopRatedGetx>(TopRatedGetx());
  }
}
