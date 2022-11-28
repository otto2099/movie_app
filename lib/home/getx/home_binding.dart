import 'package:get/get.dart';
import 'package:movie_app/home/getx/getx_popular.dart';
import 'package:movie_app/home/getx/getx_search.dart';
import 'package:movie_app/home/getx/getx_top_rated.dart';
import 'package:movie_app/theme/change_theme.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TopRatedGetx>(TopRatedGetx());
    Get.put<PopularGetx>(PopularGetx());
    Get.put<SearchGetx>(SearchGetx());
    Get.put<ChangeTheme>(ChangeTheme());
  }
}
