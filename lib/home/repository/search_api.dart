import 'dart:async';

import 'package:movie_app/common/common.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/home/models/top_rated_model.dart';

class SearchAPI {
  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<MovieModel> _suggestionSteamController =
      new StreamController.broadcast();

  Future<MovieModel> searchMovie(String query) async {
    var url = Uri.https(Enviroment.ulrBase, '3/search/movie', {
      'api_key': Enviroment.apiKey,
      'language': 'es-ES',
      'query': query,
    });

    final response = await http.get(url);
    final searchResponse = MovieModel.fromJson(response.body);

    return searchResponse;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = ((value) async {
      final result = await searchMovie(value);
      _suggestionSteamController.add(result);
    });
    final timer = Timer.periodic(const Duration(microseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(microseconds: 301))
        .then((_) => timer.cancel());
  }
}
