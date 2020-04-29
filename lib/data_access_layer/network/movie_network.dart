
import 'package:fluttermovielab3/data_access_layer/model/movie.dart';
import 'package:fluttermovielab3/data_access_layer/network/http_client.dart';

class MovieNetwork{
  String url = 'https://api.androidhive.info/json/movies.json';
  Future<List<Movie>> getMovies() async{
    var response = await HttpClient().getData(url);
    return List.from(response.map((json) => Movie.fromJson(json)));
  }

}