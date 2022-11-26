import 'dart:async';

import 'package:get/get.dart';
import 'package:movie_app/common/common.dart';
import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:movie_app/home/repository/search_repository.dart';

class SearchGetx extends GetxController {
  final _repository = SearchRepository();

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  final StreamController<MovieModel> _suggestionSteamController =
      StreamController.broadcast();

  Stream<MovieModel> get suggestionStream =>
      this._suggestionSteamController.stream;

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = ((value) async {
      final result = await _repository.getSearch(value);
      _suggestionSteamController.add(result);
    });
    final timer = Timer.periodic(const Duration(microseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(microseconds: 301))
        .then((_) => timer.cancel());
  }
}
