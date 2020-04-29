import 'dart:async';

import 'package:fluttermovielab4/data_access_layer/model/movie.dart';
import 'package:fluttermovielab4/data_access_layer/network/movie_network.dart';

class HomeProvider{
    StreamController<List<Movie>> moviesController = StreamController();
    StreamController<List<Movie>> moviesSaved = StreamController();

    HomeProvider(){
      _getMoviesFromNetwork();
      moviesSaved.add(List<Movie>());
    }

    _getMoviesFromNetwork() async {
      List<Movie> list = await MovieNetwork().getMovies();
      moviesController.add(list);
    }
}