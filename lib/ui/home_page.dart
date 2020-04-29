import 'package:flutter/material.dart';
import 'package:fluttermovielab3/data_access_layer/model/movie.dart';
import 'package:fluttermovielab3/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: VerticalList(),
    );
  }
}

class VerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      child: ListView.builder(
//          scrollDirection: Axis.vertical,
//          itemCount: 10,
//          itemBuilder: (context, index) {
//            return VerticalListItem();
//          }),
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

  ListView listBuilder(List<Movie> list){
    return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          shrinkWrap: false,
          itemBuilder: (context, index) {
            return VerticalListItem(list[index].title,list[index].image,list[index].releaseYear);
          });
  }
}

class VerticalListItem extends StatelessWidget {
  String title;
  String imgUrl;
  int releaseYear;
  VerticalListItem(this.title,this.imgUrl,this.releaseYear);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new NetworkImage(imgUrl))),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        //alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        //alignment: Alignment.topLeft,
                        child: Text("Release Year: $releaseYear ",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
