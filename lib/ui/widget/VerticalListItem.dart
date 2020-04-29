import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalListItem extends StatefulWidget {
  String title;
  String imgUrl;
  int releaseYear;

  VerticalListItem(this.title, this.imgUrl, this.releaseYear);

  @override
  VerticalListItemState createState() =>
      VerticalListItemState(this.title, this.imgUrl, this.releaseYear);
}

class VerticalListItemState extends State<VerticalListItem> {
  String title;
  String imgUrl;
  int releaseYear;
  bool saved;

  VerticalListItemState(this.title, this.imgUrl, this.releaseYear) {
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
            width: 80,
            height: 80,
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
                          overflow: TextOverflow.ellipsis,
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
                        Text("Release Year: $releaseYear ",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(saved ? Icons.favorite : Icons.favorite_border),
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
