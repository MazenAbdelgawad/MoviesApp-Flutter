import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttermovielab4/data_access_layer/model/movie.dart';
import 'package:fluttermovielab4/provider/home_data_provider.dart';
import 'package:fluttermovielab4/ui/widget/VerticalList.dart';
import 'package:fluttermovielab4/ui/widget/header.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;

  DetailsPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie',
      theme: ThemeData(
        primaryColor: Colors.blueAccent, //add2
      ),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: DetailsPageView(movie),
          ),
        ),
      ),
    );
  }
}

class DetailsPageView extends StatelessWidget {
  final Movie movie;

  DetailsPageView(this.movie);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height) * .75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(movie.posterPath))),
          ),
          Header(movie.title),
          RatingBar(
            itemSize: 35,
            initialRating: (movie.voteAverage/2),
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ),
          Header("Release Date"),
          Text(
            movie.releaseDate.toString().substring(0,10),
            style: TextStyle(
                fontSize: 16,
                color: Colors.indigoAccent),
          ),
          Header("Description"),
          Text(
            movie.overview,
            style: TextStyle(
                fontSize: 16,
                color: Colors.indigoAccent),
          ),
        ],
      ),
    );
  }
}
