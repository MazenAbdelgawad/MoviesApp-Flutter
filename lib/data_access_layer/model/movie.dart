import 'dart:convert';

//Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));
//String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  String title;
  String image;
  double rating;
  int releaseYear;
  List<String> genre;

  Movie({
    this.title,
    this.image,
    this.rating,
    this.releaseYear,
    this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title: json["title"],
    image: json["image"],
    rating: json["rating"]?.toDouble() ?? 0.0,
    releaseYear: json["releaseYear"],
    genre: List<String>.from(json["genre"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "rating": rating,
    "releaseYear": releaseYear,
    "genre": List<dynamic>.from(genre.map((x) => x)),
  };
}
