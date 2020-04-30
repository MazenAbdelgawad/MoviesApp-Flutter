
import 'package:fluttermovielab4/data_access_layer/model/movie.dart';
import 'package:fluttermovielab4/data_access_layer/network/http_client.dart';
import 'package:fluttermovielab4/data_access_layer/network/movie_respone.dart';

class MovieNetwork{
  String url = 'https://api.themoviedb.org/4/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc';
  Future<List<Movie>> getMovies() async{
    var response = await HttpClient().getData(url);
    final movieResponse =  MovieResponse.fromJson(response);
    List<Movie> movies = movieResponse.results.map((movieResponse) => Movie(
        id:movieResponse.id,
        title: movieResponse.title,
        overview: movieResponse.overview,
        releaseDate: movieResponse.releaseDate,
        voteAverage: movieResponse.voteAverage,
        posterPath: "https://image.tmdb.org/t/p/w500"+movieResponse.posterPath
    )).toList();
    return movies;
  }

}