import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttermovielab4/data_access_layer/model/movie.dart';
import 'package:fluttermovielab4/provider/home_data_provider.dart';
import 'package:provider/provider.dart';
import 'VerticalListItem.dart';

class VerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeDataProvider _provide =
        Provider.of<HomeDataProvider>(context); //access provider from the tree

    return Consumer<HomeDataProvider>(
      builder: (context, HomeDataProvider myProvider, mychild) {
        if (myProvider.moviesList.length > 0)
          return listBuilder(myProvider.moviesList);
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  ListView listBuilder(List<Movie> list) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return VerticalListItem(list[index].title, list[index].posterPath,
              list[index].releaseDate, list[index].voteAverage);
        });
  }
}
