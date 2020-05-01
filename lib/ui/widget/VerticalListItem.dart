import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VerticalListItem extends StatefulWidget {
  String title;
  String imgUrl;
  double voteAverage;
  DateTime releaseYear;

  VerticalListItem(this.title, this.imgUrl, this.releaseYear, this.voteAverage);

  @override
  VerticalListItemState createState() => VerticalListItemState(
      this.title, this.imgUrl, this.releaseYear, this.voteAverage);
}

class VerticalListItemState extends State<VerticalListItem> {
  String title;
  String imgUrl;
  DateTime releaseYear;
  double voteAverage;
  bool saved;

  VerticalListItemState(
      this.title, this.imgUrl, this.releaseYear, this.voteAverage) {
    saved = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        //mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                image: new DecorationImage(
                    fit: BoxFit.cover, image: new NetworkImage(imgUrl))),
          ),
          Expanded(
            child: Container(
              child: (Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width) * .5,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //Container(
                        //alignment: Alignment.topLeft,
                        //child:
                        Text(
                          title,
                          maxLines: 2,
                          //overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //),
                        SizedBox(
                          height: 10,
                        ),
                        //Container(
                        //alignment: Alignment.topLeft,
                        //child:
                        Text(
                            "Release on: ${releaseYear.toString().substring(0, 10)} ",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start),
                        // ),
                        SizedBox(
                          height: 3,
                        ),
                        RatingBar(
                          itemSize: 22,
                          initialRating: (voteAverage/2),
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon:
                          Icon(saved ? Icons.favorite : Icons.favorite_border),
                      color: saved ? Colors.red : null,
                      onPressed: () {
                        setState(() {
                          if (saved) {
                            saved = false;
                          } else {
                            saved = true;
                          }
                        });
                      },
                    ),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
