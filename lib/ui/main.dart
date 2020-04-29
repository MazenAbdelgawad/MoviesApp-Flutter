import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovielab3/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music APP',
      theme: ThemeData(
        primaryColor: Colors.blueAccent, //add2
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movie"),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 260,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                //labelText: "Search",
                fillColor: Colors.orangeAccent,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/img.png"),
//                    image: new NetworkImage(
//                        "https://www.woolha.com/media/2019/06/buneary.jpg")
                )),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  String _headr;

  Header(this._headr);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
                child: Text(
                  _headr,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return HorizontalListItem();
          }),
    );
  }
}

class HorizontalListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 105,
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMS87_l_PckQlygJfWDKTTdG4OqpUPrJLRkx0b5x5hZ9oBTQiY&usqp=CAU"))),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Title",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text("Description",
                overflow: TextOverflow.ellipsis, textAlign: TextAlign.start),
          ),
        ],
      ),
    );
  }
}

class VerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return VerticalListItem();
          }),
    );
  }
}

class VerticalListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 80,
      //height: 80,
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
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new NetworkImage(
                              "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/edible-flowers-1296x728-feature_0.jpg?w=500&h=500"))),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        //alignment: Alignment.topLeft,
                        child: Text(
                          "Title",
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
                        child: Text("Description",
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

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.orange,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),

              ),
              child: TextField(
                decoration: InputDecoration(
                  //labelText: "Search",
                  fillColor: Colors.white,
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Icon(
              Icons.music_note,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 2,
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 2,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
