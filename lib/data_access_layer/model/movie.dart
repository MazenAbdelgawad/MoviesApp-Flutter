import 'dart:convert';

//Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));
//String movieToJson(Movie data) => json.encode(data.toJson());


class Movie {
  String posterPath;
  int id;
  String title;
  String overview;
  DateTime releaseDate;
  double voteAverage;

  Movie({
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.posterPath,
    this.voteAverage
  });

}
