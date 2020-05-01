import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovielab4/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: Colors.blueAccent, //add2
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movie App"),
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