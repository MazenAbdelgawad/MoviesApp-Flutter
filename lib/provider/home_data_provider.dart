import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fluttermovielab4/data_access_layer/model/movie.dart';
import 'package:fluttermovielab4/data_access_layer/network/movie_network.dart';

class HomeDataProvider with ChangeNotifier{
    List<Movie> moviesList;

    HomeDataProvider(){
      moviesList = List<Movie>();
      _getMoviesFromNetwork();
      //moviesSaved.add(List<Movie>());
    }

    _getMoviesFromNetwork() async {
      moviesList = await MovieNetwork().getMovies();
      notifyListeners();
    }
}