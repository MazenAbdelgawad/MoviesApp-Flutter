import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttermovielab3/data_access_layer/model/movie.dart';
import 'package:fluttermovielab3/provider/home_provider.dart';
import 'VerticalListItem.dart';

class VerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Movie>>(
        stream: HomeProvider().moviesController.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: listBuilder(snapshot.data),
            );
          }
          if (snapshot.hasError) {
            return Text('Data Recived Error');
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView listBuilder(List<Movie> list) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return VerticalListItem(
              list[index].title, list[index].image, list[index].releaseYear);
        });
  }
}