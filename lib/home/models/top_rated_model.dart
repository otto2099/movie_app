// To parse this JSON data, do
//
//     final topRatedModel = topRatedModelFromMap(jsonString);

import 'dart:convert';

import 'package:movie_app/common/enviroment.dart';

class MovieModel {
  MovieModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<TopRatedData> results;
  int totalPages;
  int totalResults;

  factory MovieModel.fromJson(String str) =>
      MovieModel.fromMap(json.decode(str));

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        page: json["page"],
        results: List<TopRatedData>.from(
            json["results"].map((x) => TopRatedData.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class TopRatedData {
  TopRatedData({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  get fullPathImg {
    if (posterPath != null) return '${Enviroment.urlImage}${posterPath}';
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory TopRatedData.fromJson(String str) =>
      TopRatedData.fromMap(json.decode(str));

  factory TopRatedData.fromMap(Map<String, dynamic> json) => TopRatedData(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? 'No found',
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}
